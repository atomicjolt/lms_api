module CanvasApi
  module GoHelpers
    def struct_fields(model, resource_name)
      if !model["properties"]
        puts "NO properties for #{resource_name} !!!!!!!!!!!!!!!!!!!!!"
        return []
      end

      time_required = false
      fields = model["properties"].map do |name, property|
        description = ""
        description << "#{safe_rb(property['description'].gsub("\n", "\n //"))}." if property["description"].present?
        description << "Example: #{safe_rb(property['example'])}".gsub("..", "").gsub("\n", " ") if property["example"].present?

        # clean up name
        name = nested_arg(name)

        if type = go_type(name, property, false, model, "")
          if type.include? "time.Time"
            time_required = true
          end
          go_declaration(name, type) + " // #{description}"
        else
          puts "Unable to determine type for #{name}"
        end
      end.compact

      [fields, time_required]
    end

    # go_struct_fields handles the various forms of parameters documented in the Canvas API
    # Examples:
    #
    # notification_preferences[<X>][frequency]
    # Generates:
    # NotificationPreferences map[string]string `json:"notification_preferences"`
    #
    # calendar_event[child_event_data][X][start_at]
    # Generates:
    # type ChildEventData struct {
    #   StartAt     time.Time `json:"start_at"`     //  (Optional)
    #   EndAt       time.Time `json:"end_at"`       //  (Optional)
    #   ContextCode string    `json:"context_code"` //  (Optional)
    # }
    # CalendarEvent struct {
    #   ChildEventData map[string]*ChildEventData
    # }
    #
    # module_item[completion_requirement][type]
    #
    # events[start_at]
    #
    # Nested param
    # account_notification[subject]
    # Generates:
    # AccountNotification      struct {
		# 	Subject string    `json:"subject"`  //  (Required)
		# 	Message string    `json:"message"`  //  (Required)
		# 	StartAt time.Time `json:"start_at"` //  (Required)
		# 	EndAt   time.Time `json:"end_at"`   //  (Required)
		# 	Icon    string    `json:"icon"`     //  (Optional) . Must be one of warning, information, question, error, calendar
		# } `json:"account_notification"`
    #
    def go_struct_fields(nickname, params)
      nested = {}
      params.each do |p|
        structs, name = split_nested(p)
        go_to_tree(nickname, nested, structs, name, p)
      end
      go_render_params(nested)
    end

    def go_render_params(nested)
      out = ""
      nested.each do |name, val|
        if val["paramType"]
          out << "\n" + go_param_to_field(val, name)
        elsif val[:map_of]
          out << "\n#{struct_name(name)} #{val[:map_of]}"
        else
          out << "\n#{struct_name(name)} struct {"
          out << go_render_params(val)
          out << "\n} `json:\"#{name.underscore.gsub("`", "")}\"`\n"
        end
      end
      out
    end

    def go_render_child_structs
      out = ""
      @child_structs&.each do |name, params|
        out << "\ntype #{struct_name(name)} struct {"
        params.each do |n, p|
          out << "\n" + go_param_to_field(p, n)
        end
        out << "\n}\n"
      end
      out
    end

    def go_to_tree(nickname, nested, structs, name, param)
      if structs.length > 0
        struct, rest = structs.first, structs[1..-1]
        nested[struct] ||= {}
        if rest
          if is_x_param?(rest[1])
            type = go_property_type(name, param)
            child_name = rest[0]
            child_struct = "#{struct_name(nickname)}#{struct_name(child_name)}"
            @child_structs ||= {}
            @child_structs[child_struct] ||= {}
            @child_structs[child_struct][name] = param
            nested[struct][child_name] = {
              "name" => "#{struct}[#{child_name}]",
              "type" => "map[string]#{child_struct}",
              "paramType" => param["paramType"],
              "keep_type" => true,
            }
            rest.shift
            rest.shift
          elsif is_x_param?(rest[0])
            type = go_property_type(name, param)
            nested[struct][:map_of] = "map[string]#{type}"
            rest.shift
          end
        end

        if rest && rest.length > 0
          go_to_tree(nickname, nested[struct], rest, name, param)
        else
          nested[struct][name] = param
        end
      else
        nested[name] = param
      end
    end

    def go_param_path(param)
      if is_x_param?(param["name"])
        "#{go_param_kind(param)}.#{go_name(param["name"])}"
      elsif is_nested?(param)
        structs, name = split_nested(param)
        "#{go_param_kind(param)}.#{structs.map{|s| struct_name(s)}.join('.')}.#{go_name(name)}"
      else
        "#{go_param_kind(param)}.#{go_name(param["name"])}"
      end
    end

    def is_x_param?(name)
      if name
        name.include?("[<X>]") ||
        name.include?("<X>") ||
        name.include?("X") ||
        name.include?("<student_id>")
      end
    end

    def is_nested?(param)
      param["name"].include?("[")
    end

    def is_array(param)
      param["type"] == "array"
    end

    def split_nested(param)
      parts = param["name"].split("[").map{|p| p.gsub("]", "")}
      [
        parts[0...-1],
        parts.last,
      ]
    end

    def go_param_to_field(parameter, name = nil)
      name ||= parameter["name"]
      type = go_type(name, parameter)
      go_declaration(name, type) + " // " + go_comments(parameter, false)
    end

    def go_comments(parameter, include_description = true)
      out = " (#{parameter["required"] ? 'Required' : 'Optional'}) "
      if parameter["enum"]
        out << ". Must be one of #{parameter["enum"].join(', ')}"
      end
      if include_description && parameter["description"]
        out << parameter["description"].gsub("\n", "\n//    ")
      end
      out
    end

    def go_parameter_doc(parameter)
      name = parameter["name"]
      out = "# #{go_name(name)}"
      out << go_comments(parameter)
      out
    end

    def go_param_empty_value(parameter)
      name = parameter["name"]
      if is_x_param?(name)
        return "nil"
      end
      type = go_type(name, parameter)
      case type
      when "int64"
      when "int"
      when "float64"
        "0"
      when "string"
        '""'
      when "time.Time"
        "nil"
      else
        if type.include?("[]")
          "nil"
        else
          "need empty value for #{type}"
        end
      end
    end

    def is_required_field(parameter)
      parameter["required"] && !["bool", "int64", "int", "float64"].include?(go_type(parameter["name"], parameter))
    end

    def go_declaration(name, type)
      json = name.underscore.split("[")[0]
      out = "#{go_name(name)} #{type} `json:\"#{json}\"`"
    end

    def go_name(name)
      parts = name.split("[")
      parts[0].camelize.gsub("-", "").gsub("_", "")
        .gsub("`rlid`", "RLID")
        .gsub("Id", "ID")
        .gsub("url", "URL")
        .gsub("Sis", "SIS")
        .gsub("MediaTrackk", "MediaTrack")
        .gsub("Https:::::Canvas.instructure.com::Lti::Submission", "CanvasLTISubmission")

    end

    def struct_name(type)
      # Remove chars and fix spelling errors
      cleaned = type.split('|').first.strip.gsub(" ", "_")
      go_name(cleaned)
    end

    def go_require_models(parameters)
      parameters.any? { |p| go_type(p["name"], p).include?("models") }
    end

    def time_required?(parameters)
      parameters.any? { |p| go_type(p["name"], p).include?("time.Time") }
    end

    def go_property_type(name, property, return_type = false, model = nil, namespace = "models.")
      return property["type"] if property["keep_type"]

      type = property["type"].downcase
      case type
      when "{success: true}"
        "string"
      when "integer", "string", "boolean", "datetime", "number", "date"
        go_primitive(name, type, property["format"])
      when "void"
        "bool"
      when "array"
        begin
          type = if property["items"]["$ref"] == "[Integer]"
                  "[]int"
                elsif property["items"]["$ref"] == "Array"
                  "[]string"
                elsif property["items"]["$ref"] == "[String]"
                  "[]string"
                elsif property["items"]["$ref"] == "DateTime" || property["items"]["$ref"] == "Date"
                  "[]time.Time"
                elsif property["items"]["$ref"]
                  # HACK on https://canvas.instructure.com/doc/api/submissions.json
                  # the ref value is set to a full sentence rather than a
                  # simple type, so we look for that specific value
                  if property["items"]["$ref"].include?("UserDisplay if anonymous grading is not enabled")
                    "[]*#{namespace}UserDisplay"
                  elsif property["items"]["$ref"].include?("Url String The url to the result that was created")
                    "string"
                  else
                    "[]*#{namespace}#{struct_name(property["items"]["$ref"])}"
                  end
                else
                  "[]#{go_primitive(name, property["items"]["type"].downcase, property["items"]["format"])}"
                end
        rescue
          puts "Unable to discover list type for '#{name}' ('#{property}'). Defaulting to String"
          type = "string"
        end
        type
      when "object"
        puts "Using string type for '#{name}' ('#{property}') of type object."
        "string"
      else
        if property["type"] == "TermsOfService"
          # HACK There's no TermsOfService object so we return a string
          "string"
        elsif property["type"] == "list of content items"
          # HACK There's no list of content items object so we return an array of string
          "[]string"
        elsif property["type"].include?('{ "unread_count": "integer" }')
          # HACK TODO this should probably be a different type.
          "int"
        elsif return_type
          "*#{namespace}#{struct_name(property["type"])}"
        else
          puts "Unable to match '#{name}' requested property '#{property}' to GraphQL Type."
          "string"
        end
      end
    end

    def go_type(name, property, return_type = false, model = nil, namespace = "models.")
      if property["$ref"]
        "*#{namespace}#{struct_name(property['$ref'])}"
      elsif property["allowableValues"]
        "string"
      else
        go_property_type(name, property, return_type, model, namespace)
      end
    end

    def go_primitive(name, type, format)
      case type
      when "integer"
        if name.end_with?("_ids")
          "[]int64"
        else
          "int64"
        end
      when "number"
        if format == "Float"
          "float64"
        else
          # TODO many of the LMS types with 'number' don't indicate a type so we have to guess
          # Hopefully that changes. For now we go with float
          "float64"
        end
      when "string"
        "string"
      when "boolean"
        "bool"
      when "datetime"
        "time.Time"
      when "date"
        "time.Time"
      else
        raise "Unable to match requested primitive '#{type}' to Go Type."
      end
    end

    def go_field_validation(model)
      return nil unless model["properties"]
      allowable = {}
      model["properties"].each do |name, property|
        if property["allowableValues"]
          values = property["allowableValues"]["values"].map do |value|
            "\"#{value}\""
          end
          allowable[name] = values
        end
      end
      allowable
    end

    def go_param_kind(parmeter)
      case parmeter["paramType"]
      when "path"
        "Path"
      when "query"
        "Query"
      when "form"
        "Form"
      else
        "Unknown paramType"
      end
    end

    def go_path_params(params)
      select_params("path", params)
    end

    def go_query_params(params)
      select_params("query", params)
    end

    def go_form_params(params)
      select_params("form", params)
    end

    def select_params(type, parameters)
      params = parameters.select{|p| p["paramType"] == type}
      if params && !params.nil? && params.length > 0
        params
      else
        nil
      end
    end

    def go_api_url
      url = @api_url
      @args.each do |arg|
        url.gsub(arg, "+\"#{go_name(arg)}\"+")
      end
      url
    end


  end
end
