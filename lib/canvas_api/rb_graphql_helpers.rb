module CanvasApi
  module GraphQLHelpers

    def graphql_type(name, property, return_type = false, model = nil)
      if property["$ref"]
        canvas_name(property['$ref'])
      elsif property["allowableValues"]
        enum_class_name(model, name)
      else
        type = property["type"].downcase
        case type
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
                     "[#{canvas_name(property["items"]["$ref"])}]"
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
          elsif return_type
            canvas_name(property["type"])
          else
            puts "Unable to match '#{name}' requested property '#{property}' to GraphQL Type."
            "String"
          end
        end
      end
    end

    def canvas_name(type)
      name = type.split('|').first.strip.singularize
      "LMSGraphQL::Types::Canvas::#{name}"
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

    def graphql_fields(model, resource_name)
      if !model["properties"]
        puts "NO properties for #{resource_name} !!!!!!!!!!!!!!!!!!!!!"
        return []
      end
      model["properties"].map do |name, property|
        description = ""
        description << "#{safe_rb(property['description'])}." if property["description"].present?
        description << "Example: #{safe_rb(property['example'])}".gsub("..", "").gsub("\n", " ") if property["example"].present?

        if type = graphql_type(name, property, false, model)
          <<-CODE
  field :#{name.underscore}, #{type}, "#{description}", null: true
          CODE
        else
          puts "Unable to determine type for #{name}"
        end
      end.compact
    end

    def type_from_operation(operation)
      graphql_type("operation", operation, true)
    end

    def name_from_operation(operation)
      type = no_brackets(type_from_operation(@operation))
      if !is_basic_type(type)
        make_file_name(type)
      else
        "return_value"
      end
    end

    def is_basic_type(type)
      ["Int", "String", "Boolean", "LMSGraphQL::Types::DateTimeType", "Float", "ID"].include?(type)
    end

    def no_brackets(str)
      str.gsub("[", "").gsub("]", "")
    end

    def make_file_name(str)
      str.underscore.split("/").last.split("|").first.strip.singularize
    end

    def require_from_operation(operation)
      type = no_brackets(type_from_operation(@operation))
      if !is_basic_type(type)
        "require_relative \"../../types/canvas/#{make_file_name(type)}\""
      end
    end

    def require_from_properties(model)
      return unless model["properties"]
      requires = model["properties"].map do |name, property|
        type = no_brackets(graphql_type(name, property, true, model))
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

    def nested_arg(str)
      str.gsub("[", "_").gsub("]", "").gsub("*", "star").gsub("<X>", "_x_")
    end

  end

end