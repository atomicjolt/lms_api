module CanvasApi

  module GraphQLHelpers

    def graphql_type(name, property)
      if property["$ref"]
        "#{property['$ref']}, resolve: function(model){ return model.#{name}; }"
      else
        type = property["type"]
        case type
        when "integer", "string", "boolean", "datetime", "number"
          graphql_primitive(type, property["format"])
        when "array"
          begin
            type = if property["items"]["$ref"]
                     property["items"]["$ref"]
                   else
                     graphql_primitive(property["items"]["type"], property["items"]["format"])
                   end
          rescue
            puts "Unable to discover list type for '#{name}' ('#{property}'). Defaulting to GraphQLString"
            type = "GraphQLString"
          end
          "new GraphQLList(#{type})"
        when "object"
          puts "Using string type for '#{name}' ('#{property}') of type object."
          "GraphQLString"
        else
          puts "Unable to match '#{name}' requested property '#{property}' to GraphQL Type."
          "GraphQLString"
        end
      end
    end

    def graphql_primitive(type, format)
      case type
      when "integer"
        "GraphQLInt"
      when "number"
        if format == "float64"
          "GraphQLFloat"
        else
          # TODO many of the LMS types with 'number' don't indicate a type so we have to guess
          # Hopefully that changes. For now we go with float
          "GraphQLFloat"
        end
      when "string"
        "GraphQLString"
      when "boolean"
        "GraphQLBoolean"
      when "datetime"
        "GraphQLDateTime"
      else
        raise "Unable to match requested primitive '#{type}' to GraphQL Type."
      end
    end

    def graphql_resolve(name, property)
      if property["$ref"]
        "resolve(model){ return model.#{name}; }"
      elsif property["type"] == "array" && property["items"] && property["items"]["$ref"]
        "resolve(model){ return model.#{name}; }"
      end
      "resolve(model){ return model.#{name}; }"
    end

    def graphql_fields(model, resource_name)
      model["properties"].map do |name, property|
        # HACK. This property doesn't have any metadata. Throw in a couple lines of code
        # specific to this field.
        if name == "created_source" && property == "manual|sis|api"
          "#{name}: new GraphQLEnumType({ name: '#{name}', values: { manual: { value: 'manual' }, sis: { value: 'sis' }, api: { value: 'api' } } })"
        else

          description = ""
          if property["description"].present? && property["example"].present?
            description << "#{safe_js(property['description'])}. Example: #{safe_js(property['example'])}".gsub("..", "").gsub("\n", " ")
          end

          if type = graphql_type(name, property)
            resolve = graphql_resolve(name, property)
            resolve = "#{resolve}, " if resolve.present?
            "#{name}: { type: #{type}, #{resolve}description: \"#{description}\" }"
          end

        end
      end.compact
    end

    def safe_js(str)
      str = str.join(", ") if str.is_a?(Array)
      str = str.map { |_k, v| v }.join(", ") if str.is_a?(Hash)
      return str unless str.is_a?(String)
      str.gsub('"', "'")
    end

    def graphql_resolver_class(name)
      # HACK Some resolvers have both singular and plural versions, so keep the plural on those
      return name.camelize if name == "get_custom_colors"

      name.classify
    end
  end

end
