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
          raise "Unable to determine type for #{name}"
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
        elsif val[:array_of]
          out << "\n#{struct_name(name)} #{val[:array_of]}"
        elsif val[:map_of]
          out << "\n#{struct_name(name)} #{val[:map_of]}"
        else
          out << "\n#{struct_name(name)} struct {"
          out << go_render_params(val)
          out << "\n} `json:\"#{name.underscore.gsub("`", "")}\" url:\"#{name.underscore.gsub("`", "")},omitempty\"`\n"
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

    # HACK for https://canvas.instructure.com/doc/api/quiz_submissions.html
    # update_student_question_scores_and_comments has a param with the following form
    # {"paramType"=>"form", "name"=>"quiz_submissions[questions]", "type"=>"array", "format"=>nil, "required"=>false, "deprecated"=>false, "items"=>{"$ref"=>"Hash"}}
    QuizSubmissionOverrides = "QuizSubmissionOverrides"

    def go_to_tree(nickname, nested, structs, name, param)
      @child_structs ||= {}

      # HACK for https://canvas.instructure.com/doc/api/quiz_submissions.html
      if nickname == "update_student_question_scores_and_comments"
        @child_structs[QuizSubmissionOverrides] = {
          "score" => {"name"=>"score", "type"=>"float"},
          "comment" => {"name"=>"comment", "type"=>"string"},
        }
      end

      if structs.length > 0
        struct, rest = structs.first, structs[1..-1]
        nested[struct] ||= {}
        if rest
          if is_x_param?(rest[1])
            type = go_property_type(name, param)
            child_name = rest[0]
            child_struct = "#{struct_name(nickname)}#{struct_name(child_name)}"
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
            if rest[0] == structs[1]
              child_name = structs[0]
              child_struct = "#{struct_name(nickname)}#{struct_name(child_name)}"
              nested[struct][:map_of] = "map[string]#{child_struct}"
              @child_structs[child_struct] ||= {}
              @child_structs[child_struct][name] = param
            else
              type = go_property_type(name, param)
              nested[struct][:map_of] = "map[string]#{type}"
            end
            rest.shift
          end
        end

        if rest && rest.length > 0
          go_to_tree(nickname, nested[struct], rest, name, param)
        else
          if @child_structs && child_struct = nested[struct][:array_of]
            @child_structs[child_struct][name] = param
          else
            nested[struct][name] = param
          end
        end
      else
        nested[name] = param
        if param["type"] == "array" && ["events"].include?(param["name"])
          child_struct = "#{struct_name(nickname)}#{struct_name(param["name"])}"
          @child_structs ||= {}
          @child_structs[child_struct] ||= {}
          nested[name][:array_of] = child_struct
          puts "******** Using custom struct #{child_struct}"
        end
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
        name.include?("<student_id>") ||
        name.include?("0")
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
      out = "# #{go_param_path(parameter)}"
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
      when "map[string](interface{})"
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
      json = name.underscore.split("[")[0].gsub("`rlid`", "rlid")
      out = "#{go_name(name)} #{type} `json:\"#{json}\" url:\"#{json},omitempty\"`"
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

    def go_require_models(parameters, nickname, return_type)
      parameters.any? { |p| go_type(p["name"], p).include?("models") } ||
      ["assign_unassigned_members"].include?(@nickname) ||
      (return_type &&
        return_type != "bool" &&
        !return_type.include?("string") &&
        !return_type.include?("SuccessResponse") &&
        !return_type.include?("UnreadCount")
      )
    end

    def time_required?(parameters)
      parameters.any? { |p| go_type(p["name"], p).include?("time.Time") }
    end

    def go_type(name, property, return_type = false, model = nil, namespace = "models.")
      if property["$ref"]
        "*#{namespace}#{struct_name(property['$ref'])}"
      else
        go_property_type(name, property, return_type, model, namespace)
      end
    end

    def go_property_type(name, property, return_type = false, model = nil, namespace = "models.")
      return property["type"] if property["keep_type"]
      return property[:array_of] if property[:array_of]
      type = property["type"].downcase
      case type
      when "{success: true}"
        "canvasapi.SuccessResponse"
      when "integer", "string", "boolean", "datetime", "number", "date"
        go_primitive(name, type, property["format"])
      when "void"
        "bool" # TODO this doesn't seem right?
      when "array"
        go_ref_property_type(property, namespace)
      when "object"
        puts "Using string type for '#{name}' ('#{property}') of type object."
        "map[string](interface{})"
      else
        if property["type"] == "list of content items"
          # HACK There's no list of content items object so we return an array of string
          "[]string"
        elsif property["type"].include?('{ "unread_count": "integer" }')
          "canvasapi.UnreadCount"
        elsif return_type
          "*#{namespace}#{struct_name(property["type"])}"
        elsif property["type"] == "Hash"
          "map[string](interface{})"
        elsif property["type"] == "String[]"
          "[]string"
        elsif property["type"] == "[Answer]"
          "[]*models.Answer"
        elsif property["type"] == "QuizUserConversation"
          "canvasapi.QuizUserConversation"
        elsif [
          "Assignment",
          "BlueprintRestriction",
          "RubricAssessment",
        ].include?(property["type"])
          "*models.#{property["type"]}"
        elsif property["type"] == "multiple BlueprintRestrictions"
          "[]*models.BlueprintRestriction"
        elsif property["type"] == "File"
          # This won't work. If we ever need to use this type we'll need to do some refactoring
          "string"
        elsif property["type"] == "Deprecated"
          "string"
        elsif property["type"] == "SerializedHash"
          # Not sure this will work
          "map[string](interface{})"
        elsif property["type"].downcase == "json"
          "map[string](interface{})"
        elsif ["Numeric", "float"].include?(property["type"])
          "float64"
        elsif property["type"] == "GroupMembership | Progress"
          "no-op" # this is handled further up the stack
        elsif property["type"] == "URL"
          "string"
        else
          raise "Unable to match '#{name}' requested property '#{property}' to Go Type."
        end
      end
    end

    def go_ref_property_type(property, namespace)
      ref_type = property.dig("items", "$ref")
      if ref_type == nil
        if property["type"] == "array"
          "[]string"
        else
          "string"
        end
      elsif ref_type == "Hash"
        # HACK for https://canvas.instructure.com/doc/api/quiz_submissions.html
        if property["name"] == "quiz_submissions[questions]"
          "map[string]QuizSubmissionOverrides"
        else
          raise "No type available for #{property}"
        end
      elsif ref_type == "[Integer]"
        "[]int"
      elsif ref_type == "Array"
        "[]string"
      elsif ref_type == "[String]"
        "[]string"
      elsif ref_type == "DateTime" || ref_type == "Date"
        "[]time.Time"
      elsif ref_type == "object"
        "map[string](interface{})"
      elsif ref_type
        # HACK on https://canvas.instructure.com/doc/api/submissions.json
        # the ref value is set to a full sentence rather than a
        # simple type, so we look for that specific value
        if ref_type.include?("UserDisplay if anonymous grading is not enabled")
          "[]*#{namespace}UserDisplay"
        elsif ref_type.include?("Url String The url to the result that was created")
          "string"
        else
          "[]*#{namespace}#{struct_name(ref_type)}"
        end
      else
        "[]#{go_primitive(name, property["items"]["type"].downcase, property["items"]["format"])}"
      end
    rescue
      raise "Unable to discover Go list type for '#{name}' ('#{property}')."
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
          allowable[name] = {
            values: values,
            type: property["type"],
          }
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

    def go_do_return_statement(operation, nickname)
      if nickname == "assign_unassigned_members" || operation["type"] == "array"
        "return nil, nil, err"
      elsif type = go_return_type(operation)
        if type == "bool"
          "return false, err"
        elsif type == "string"
          'return "", err'
        elsif type == "integer"
          "return 0, err"
        else
          "return nil, err"
        end
      else
        "return err"
      end
    end

    def go_do_final_return_statement(operation, nickname)
      if nickname == "assign_unassigned_members"
        "return &groupMembership, &progress, nil"
      elsif go_return_type(operation)
        if operation["type"] == "array"
          "return ret, pagedResource, nil"
        elsif operation["type"] == "boolean" || operation["type"] == "string" || operation["type"] == "integer"
          "return ret, nil"
        else
          "return &ret, nil"
        end
      else
        "return nil"
      end
    end

    def go_do_return_value(operation, nickname)
      if nickname == "assign_unassigned_members"
        # HACK. harded coded because Assign unassigned members returns different values based on input
        # see https://canvas.instructure.com/doc/api/group_categories.html#method.group_categories.assign_unassigned_members
        "(*models.GroupMembership, *models.Progress, error)"
      elsif type = go_return_type(operation)
        if operation["type"] == "array"
          "(#{type}, *canvasapi.PagedResource, error)"
        else
          "(#{type}, error)"
        end
      else
        "error"
      end
    end

    def go_return_type(operation, is_decl = false)
      prefix = is_decl ? "" : "*"
      suffix = is_decl ? "{}" : ""
      if operation["type"] == "void"
        nil
      elsif operation["type"] == "array"
        model = operation.dig("items", "$ref")
        if model.include?(" ")
          # Handle cases with spaces using go_property_type
          type = go_property_type(operation["nickname"], operation)
          if type == "string"
            type = "[]#{type}"
          end
          "#{type}#{suffix}"
        else
          "[]*models.#{go_name(model)}#{suffix}"
        end
      elsif operation["type"] == "boolean"
        "bool"
      elsif operation["type"] == "integer"
        "int64"
      elsif model = operation["type"]
        if model.include?(" ")
          # Handle cases with spaces using go_property_type
          type = go_property_type(operation["nickname"], operation)
          if type == "string"
            type
          else
            "#{prefix}#{type}#{suffix}"
          end
        else
          "#{prefix}models.#{go_name(model)}#{suffix}"
        end
      else
        raise "No return type found for #{operation}"
      end
    end
  end
end
