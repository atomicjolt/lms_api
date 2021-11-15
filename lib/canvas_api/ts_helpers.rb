require 'rack'

module CanvasApi
  module TsHelpers
    def ts_url_parts(api_url)
      api_url.split(/(\{[a-z_]+\})/).map do |part|
        if part[0] == "{"
          arg = part.gsub(/[\{\}]/, "")
          "this.params.#{arg}"
        else
          %{"#{part}"}
        end
      end
    end

    def ts_array_type_converter(nickname, param)
      return "Array<#{ts_enum_name(nickname, param)}>" if param["enum"].present?
      return "Array<unknown>" if param.dig("items", "type").blank?

      return "Array<#{ts_type_converter(nickname, param["items"]["type"])}>"
    end

    def ts_type_converter(nickname, param)
      # This lets us pass raw strings in too, so that we can handle parsing
      # array types
      if param.is_a?(Hash)
        param_type = param["type"].downcase
      elsif param.is_a?(String)
        param_type = param
        param = {}
      end

      case param_type.downcase
      when "array"
        return ts_array_type_converter(nickname, param)
      when "string[]"
        return ts_array_type_converter(nickname, param)
      when "string"
        return ts_enum_name(nickname, param) if param["enum"].present?
        return "string"
      when "url"
        return "string"
      when "boolean"
        return "boolean"
      when "integer"
        return "bigint" if param["format"] == "int64"

        return "number"
      when "number"
        return "number"
      when "numeric"
        return "number"
      when "datetime"
        # We want a string in ISO8601 YYYY-MM-DDTHH:MM:SSZ
        return "string"
      when "date"
        # We want a string in yyyy-mm-dd format or ISO8601 YYYY-MM-DDTHH:MM:SSZ
        return "string"
      when "blueprintrestriction"
        return "Record<string, unknown>"
      when "hash"
        return "Record<#{ts_enum_name(nickname, param)}, unknown>" if param["enum"].present?
        return "Record<string, unknown>"
      when "object"
        return "Record<string, unknown>"
      when "serializedhash"
        return "Record<string, unknown>"
      when "assignment"
        return "Record<string, unknown>"
      when "deprecated"
        return "unknown"
      when "file"
        return "unknown"
      when "multiple blueprintrestrictions"
        return "unknown"
      when "json"
        return "string"
      when "[answer]"
        return "Array<unknown>"
      when "quizuserconversation"
        return "unknown"
      when "rubricassessment"
        return "unknown"
      when "unknown"
        return "unknown"
      else
        pp param
        throw "Couldn't get typescript type for parameter #{param}"
      end
    end

    def ts_enum_name(nickname, param)
      "#{nickname.camelize}Input#{param["name"].gsub(/\[|\]|<|>/, "_").camelize}Enum"
    end

    def ts_type_creator(nickname, params)
      non_nested_params, nested_params = parse_nested_parameters(params)
      nested_types = nested_type_converter(non_nested_params, nested_params)

      result = ""

      params.each do |param|
        if param["enum"]
          result += <<-TS
  type #{ts_enum_name(nickname, param)} =
    #{param["enum"].map { |t| "\"#{t}\"" }.uniq.join("|\n")}
          TS
        end
      end

      if (nested_types.present? || non_nested_params.present?)
        result += "interface #{nickname.camelize}InputType {\n#{nested_types}\n}\n"
      end

      result
    end

    def nested_type_converter(non_nested_params, nested_params)
      # We'll be handling the non nested that overlap with nested when we handle
      # the nested params, so remove them
      non_nested = non_nested_params.reject { |name, data| nested_params[name].present? }

      non_nested_results = non_nested.map do |param_name, param_data|
        if param_name.include?("[")
          puts param_name
          pp param_data
          pp non_nested_params
          pp nested_params
          throw "Found parameter with [] in name"
        end

        data = JSON.parse(param_data)
        required = data["required"]

        # Sometimes canvas gives us * as a parameter name to allow other
        # parameters to be passed. We can use an indexer for this. Indexers
        # are also inherently optional, and you can't add a ? as it's not valid
        # syntax.
        if param_name == "*" || param_name == "X" || param_name == "<X>"
          param_name = "[x: string]"
          data["type"] = "unknown"
          required = true
        else
          # Quote other param names because Canvas sometimes has urls as
          # parameter names
          param_name = "\"#{param_name}\""
        end

        "#{param_name}#{required ? "" : "?"}: #{ts_type_converter(@nickname, data)};"
      end

      nested_results = nested_params.map do |param_name, param_data|
        non_nested_data = non_nested_params[param_name]

        # We can only get required fields from the Canvas data, which is a JSON
        # string. We don't parse it before this point because it would make it
        # difficult to tell the Canvas data with the required, type, etc fields
        # from any parsed double nested fields.
        required = non_nested_data.is_a?(String) && JSON.parse(non_nested_data)["required"]

        if param_name == "*" || param_name == "X" || param_name == "<X>"
          param_name = "[x: string]"
          required = true
        else
          # Quote other param names because Canvas sometimes has urls as
          # parameter names
          param_name = "\"#{param_name}\""
        end

        result = "#{param_name}#{required ? "" : "?"}: "

        # Sometimes Canvas returns the same parameter twice, one as a nested
        # parameter and one not. We'll accept both, so we add the non nested
        # version here.
        if non_nested_data.is_a?(String)
          result += "#{ts_type_converter(@nickname, JSON.parse(non_nested_data))} | "
        end

        if param_data.is_a?(Array)
          if param_data.all? { |p| p.is_a?(String) }
            # We got an array of JSON strings, which means that we have an array
            # field that doesn't have any sub fields for some reason. Just make
            # it an array of any.
            result += "Array<unknown>;"
          else
            # We reject strings, because sometimes Canvas defines an array field
            # that has subfields, but for some reason the array field is itself
            # also defined by itself. In that case we get one string, and then
            # some other parameters.
            inner_params = param_data.reject { |p| p.is_a?(String) }.map do |array_param_data|
              array_non_nested, array_nested = partition_nested_parameters(array_param_data)
              nested_type_converter(array_non_nested, array_nested)
            end

            result += "{\n#{inner_params.join("\n")}\n}[]\n"
          end
        else
          param_data_non_nested, param_data_nested = partition_nested_parameters(param_data)
          result += "{\n#{nested_type_converter(param_data_non_nested, param_data_nested)}\n}\n"
        end

        result
      end

      "#{non_nested_results.join("\n")}\n#{nested_results.join("\n")}"
    end

    def partition_nested_parameters(params)
      non_nested_params = params.select { |name, data| data.is_a?(String) }
      nested_params = params.reject { |name, data| data.is_a?(String) }
      [non_nested_params, nested_params]
    end

    def parse_nested_parameters(params)
      # Marshal load/dump lets us duplicate the object
      params = Marshal.load(Marshal.dump(params))
      # We have to fix up the params so that when we get params with array types
      # they have the right names to that rack can parse them
      param_name_map = {}
      params.each do |param|
        if param["type"] == "array" && param.dig("items", "$ref")
          param_name_map[param["name"]] = param["name"] + "[]"
          param["fixed_name"] = param_name_map[param["name"]]
        else
          param["fixed_name"] = param["name"]
        end
      end

      nested_params = params.select { |p| p["name"].include?("[") }
      non_nested_params = params.reject { |p| p["name"].include?("[") }

      # Convert non nested params into a hash like nested_params will be by
      # the Rack parser
      non_nested_params = non_nested_params.reduce({}) do |nn_params, param|
        nn_params[param["name"]] = param.to_json
        nn_params
      end

      # We're doing this so that we can use Rack to parse the nested fields out
      # nicely nested without having to implement it ourselves
      fake_form_query = nested_params.map do |param|
        # We have to add the [] of parent fields for nested fields too
        param_name_map.each do |old_name, new_name|
          param["name"].gsub!(old_name, new_name)
        end
        "#{param["name"]}=#{param.to_json}"
      end
      fake_form_query = fake_form_query.join("&")

      nested_params = Rack::Utils.parse_nested_query(fake_form_query)

      return [non_nested_params, nested_params]
    end
  end
end
