module CanvasApi
  module GraphQLHelpers
    # list of names that conflict with built in methods,
    # Instead of generating a regular field for these ones,
    # generate a resolver method
    CONFLICTING_NAMES = ["end", "context", "next", "module"]

    def graphql_type(name, property, return_type = false, model = nil, input_type = false)
      if property["$ref"]
        canvas_name(property['$ref'], input_type)
      elsif property["allowableValues"]
        enum_class_name(model, name)
      else
        type = property["type"].downcase
        case type
        when "{success: true}"
          "String"
        when "integer", "string", "boolean", "datetime", "number", "date"
          graphql_primitive(name, type, property["format"])
        when "void"
          "Boolean"
        when "array"
          begin
            type = if property["items"]["$ref"] == "[Integer]"
                    "[Int]"
                  elsif property["items"]["$ref"] == "Array"
                    "[String]"
                  elsif property["items"]["$ref"] == "[String]"
                    "[String]"
                  elsif property["items"]["$ref"] == "DateTime" || property["items"]["$ref"] == "Date"
                    "[LMSGraphQL::Types::DateTimeType]"
                  elsif property["items"]["$ref"]
                    # HACK on https://canvas.instructure.com/doc/api/submissions.json
                    # the ref value is set to a full sentence rather than a
                    # simple type, so we look for that specific value
                    if property["items"]["$ref"].include?("UserDisplay if anonymous grading is not enabled")
                      "[LMSGraphQL::Types::Canvas::CanvasUserDisplay]"
                    elsif property["items"]["$ref"].include?("Url String The url to the result that was created")
                      "String"
                    else
                      "[#{canvas_name(property["items"]["$ref"], input_type)}]"
                    end
                  else
                    graphql_primitive(name, property["items"]["type"].downcase, property["items"]["format"])
                  end
          rescue
            puts "Unable to discover list type for '#{name}' ('#{property}'). Defaulting to String"
            type = "String"
          end
          type
        when "object"
          puts "Using string type for '#{name}' ('#{property}') of type object."
          "String"
        else
          if property["type"] == "TermsOfService"
            # HACK There's no TermsOfService object so we return a string
            "String"
          elsif property["type"] == "list of content items"
            # HACK There's no list of content items object so we return an array of string
            "[String]"
          elsif property["type"].include?('{ "unread_count": "integer" }')
            # HACK TODO this should probably be a different type.
            "Int"
          elsif return_type
            canvas_name(property["type"], input_type)
          else
            puts "Unable to match '#{name}' requested property '#{property}' to GraphQL Type."
            "String"
          end
        end
      end
    end

    def canvas_name(type, input_type = false)
      # Remove chars and fix spelling errors
      name = type.split('|').first.strip.gsub(" ", "_").singularize.gsub("MediaTrackk", "MediaTrack")
      "LMSGraphQL::Types::Canvas::Canvas#{name}#{input_type ? 'Input' : ''}"
    end

    def graphql_primitive(name, type, format)
      return "[ID]" if name.end_with?("_ids")
      return "ID" if name == "id" || name.end_with?("_id")
      case type
      when "integer"
        "Int"
      when "number"
        if format == "float64"
          "Float"
        else
          # TODO many of the LMS types with 'number' don't indicate a type so we have to guess
          # Hopefully that changes. For now we go with float
          "Float"
        end
      when "string"
        "String"
      when "boolean"
        "Boolean"
      when "datetime"
        "LMSGraphQL::Types::DateTimeType"
      when "date"
        "LMSGraphQL::Types::DateTimeType"
      else
        raise "Unable to match requested primitive '#{type}' to GraphQL Type."
      end
    end

    def enum_class_name(model, field_name)
      "#{model['id'].classify}#{field_name.classify}Enum"
    end

    def graphql_field_enums(model)
      return unless model["properties"]
      enums = model["properties"].map do |name, property|
        if property["allowableValues"]
          values = property["allowableValues"]["values"].map do |value|
            "value \"#{value}\""
          end.join("\n          ")
          <<-CODE
        class #{enum_class_name(model, name)} < ::GraphQL::Schema::Enum
          #{values}
        end
          CODE
        end
      end.compact
      if enums.length > 0
        enums.join("\n        ")
      else
        ""
      end
    end

    def graphql_fields(model, resource_name, argument = false, input_type = false)
      if !model["properties"]
        puts "NO properties for #{resource_name} !!!!!!!!!!!!!!!!!!!!!"
        return []
      end
      model["properties"].map do |name, property|
        description = ""
        description << "#{safe_rb(property['description'])}." if property["description"].present?
        description << "Example: #{safe_rb(property['example'])}".gsub("..", "").gsub("\n", " ") if property["example"].present?

        # clean up name
        name = nested_arg(name)

        if type = graphql_type(name, property, false, model, input_type)
          if argument
            argument_format(name, type, description)
          else
            if CONFLICTING_NAMES.include?(name.underscore)
              field_resolver_format(name, type, description)
            else
              field_format(name, type, description)
            end
          end
        else
          puts "Unable to determine type for #{name}"
        end
      end.compact
    end

    def argument_format(name, type, description="")
      "argument :#{name.underscore}, #{type}, \"#{description}\", required: false\n"
    end

    def field_format(name, type, description="")
      "field :#{name.underscore}, #{type}, \"#{description}\", null: true\n"
    end

    def field_resolver_format(name, type, description)
      <<-CODE
field :#{name.underscore}, #{type}, "#{description}", resolver_method: :resolve_#{name.underscore}, null: true
        def resolve_#{name.underscore}
          object[:#{name.underscore}]
        end
      CODE
    end


    def type_from_operation(operation)
      type = graphql_type("operation", operation, true)
    end

    def name_from_operation(operation)
      type = no_brackets_period(type_from_operation(@operation))
      if !is_basic_type(type)
        make_file_name(type)
      else
        "return_value"
      end
    end

    def is_basic_type(type)
      ["Int", "String", "Boolean", "LMSGraphQL::Types::DateTimeType", "Float", "ID"].include?(type)
    end

    def no_brackets_period(str)
      str.gsub("[", "").gsub("]", "").gsub(".", "")
    end

    def make_file_name(str)
      str.underscore.split("/").last.split("|").first.gsub("canvas_", "").gsub(" ", "_").strip.singularize
    end

    def require_from_operation(operation)
      type = no_brackets_period(type_from_operation(@operation))
      if !is_basic_type(type)
        "require_relative \"../../types/canvas/#{make_file_name(type)}\""
      end
    end

    def require_from_properties(model)
      return unless model["properties"]
      requires = model["properties"].map do |name, property|
        type = no_brackets_period(graphql_type(name, property, true, model))
        if !is_basic_type(type) && !property["allowableValues"]
          "require_relative \"#{make_file_name(type)}\""
        end
      end.compact
      if requires.length > 0
        requires.join("\n")
      else
        ""
      end
    end

    def safe_rb(str)
      str = str.join(", ") if str.is_a?(Array)
      str = str.map { |_k, v| v }.join(", ") if str.is_a?(Hash)
      return str unless str.is_a?(String)
      str.gsub('"', "'")
    end

    def params_as_string(parameters, paramTypes)
      filtered = parameters.select{ |p| paramTypes.include?(p["paramType"]) }
      if filtered && !filtered.empty?
        s = filtered.
          map{ |p| "              \"#{p['name']}\": #{nested_arg(p['name'])}" }.
          join(",\n")
        "            {\n#{s}\n            }"
      else
        "            {}"
      end
    end

  end

end
