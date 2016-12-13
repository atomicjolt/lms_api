require "httparty"
require "active_support"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/string/inflections"

namespace :canvas do
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
            if property["items"]["$ref"]
              type = property["items"]["$ref"]
            else
              type = graphql_primitive(property["items"]["type"], property["items"]["format"])
            end
          rescue
            type = "GraphQLString"
          end
          "new GraphQLList(#{type})"
        when "object"
          # TODO handle objects
          nil
        else
          "unknown - #{property}"
        end
      end
    end

    def graphql_resolve(name, property)
      if property["$ref"]
        "function(model){ return model.#{name}; }"
      elsif property["type"] == "array" && property["items"] && property["items"]["$ref"]
        "function(model){ return model.#{name}; }"
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
      end
    end

    def fields(model, resource_name)
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
            resolve = "resolve: #{resolve}, " if resolve.present?
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
  end

  module JsHelpers
    def js_url_parts(api_url)
      api_url.split(/(\{[a-z_]+\})/).map do |part|
        if part[0] == "{"
          arg = part.gsub(/[\{\}]/, "")
          "args['#{arg}']"
        else
          %{"#{part}"}
        end
      end
    end

    def js_args(args)
      if args.present?
        "[\"#{args.join('","')}\"]"
      else
        "[]"
      end
    end

    def parameters_doc(operation)
      if operation["parameters"].present?
        parameters = operation["parameters"].
          reject { |p| p["paramType"] == "path" }.
          map { |p| "#{p['name']}#{p['required'] ? ' (required)' : ''}" }.
          compact
        if parameters.present?
          "\n// const query = {\n//   #{parameters.join("\n//   ")}\n// }"
        else
          ""
        end
      else
        ""
      end
    end

    def key_args(args)
      if args.blank?
        ""
      elsif args.length > 1
        "#{nickname}_{#{args.join('}_{')}}"
      else
        "#{nickname}_#{args[0]}"
      end
    end

    def reducer_key(nickname, args)
      "#{nickname}#{key_args(args)}"
    end

  end

  module RubyHelpers

    def ruby_api_url(api_url)
      api_url.gsub("{", "#\{")
    end

  end

  class Render
    include GraphQLHelpers
    include JsHelpers
    include RubyHelpers
    attr_accessor :template, :description, :resource, :api_url, :operation,
                  :args, :method, :api, :name, :resource_name, :resource_api,
                  :nickname, :notes, :content, :summary, :model, :model_name

    def initialize(template, api, resource, resource_api, operation, parameters, content, model)
      @template = File.read(File.expand_path(template, __dir__))
      if api
        @api         = api
        @name        = @api["path"].gsub("/", "").gsub(".json", "")
        @description = @api["description"]
      end
      if resource
        @resource      = resource
        @resource_name = resource["resourcePath"].gsub("/", "")
      end
      if resource_api
        @resource_api = resource_api
        @api_url      = resource_api["path"].gsub("/v1/", "")
        @args         = args(@api_url)
      end
      if operation
        nickname = operation["nickname"]
        nickname = "#{@name}_#{nickname}" if [
          "upload_file",
          "query_by_course",
          "preview_processed_html",
          "create_peer_review_courses",
          "create_peer_review_sections",
          "set_extensions_for_student_quiz_submissions"
        ].include?(nickname)

        @method    = operation["method"]
        @operation = operation
        @nickname  = nickname
        @notes     = operation["notes"].gsub("\n", "\n// ")
        @summary   = operation["summary"]
      end
      if parameters
        @parameters = parameters.map { |p| p.delete("description"); p }
      end
      @content = content
      @model = model
    end

    def args(api_url)
      api_url.split("/").map do |part|
        if part[0] == "{"
          part.gsub(/[\{\}]/, "")
        end
      end.compact
    end

    def render
      ERB.new(@template, nil, "-").result(binding).strip
    end

    def save(file)
      File.write(file, render)
    end

  end

  class LMSApiBuilder

    def self.build
      current_path = File.expand_path(File.dirname(__FILE__))
      atomic_client = File.expand_path(File.join(current_path, "../../../atomic-client"))
      atomic_lti = File.expand_path(File.join(current_path, "../../../atomic-lti"))
      project_root = File.expand_path(File.join(current_path, "../../"))

      endpoint = "https://canvas.instructure.com/doc/api"
      directory = HTTParty.get("#{endpoint}/api-docs.json")
      lms_urls_rb = []
      lms_urls_js = []
      models = []
      queries = []
      mutations = []
      directory["apis"].each do |api|
        puts "Generating #{api['description']}"
        resource = HTTParty.get("#{endpoint}#{api['path']}")
        constants = []
        resource["apis"].each do |resource_api|
          resource_api["operations"].each do |operation|
            parameters = operation["parameters"]
            constants << Render.new("./lms_api/constant.erb", api, resource, resource_api, operation, parameters, nil, nil).render
            lms_urls_rb << Render.new("./lms_api/rb_url.erb", api, resource, resource_api, operation, parameters, nil, nil).render
            lms_urls_js << Render.new("./lms_api/js_url.erb", api, resource, resource_api, operation, parameters, nil, nil).render
            if "GET" == operation["method"].upcase
              queries << Render.new("./lms_api/graphql_query.erb", api, resource, resource_api, operation, parameters, nil, nil).render
            else
              mutations << Render.new("./lms_api/graphql_mutation.erb", api, resource, resource_api, operation, parameters, nil, nil).render
            end
          end
        end
        resource["models"].map do |_name, model|
          if model["properties"] # Don't generate models without properties
            models << Render.new("./lms_api/graphql_model.erb", api, resource, nil, nil, nil, nil, model).render
          end
        end
        # Generate one file of constants for every LMS API
        constants_renderer = Render.new("./lms_api/constants.erb", api, resource, nil, nil, nil, constants, nil)
        constants_renderer.save("#{atomic_client}/client/js/libs/canvas/constants/#{constants_renderer.name}.js")
      end

      Render.new("./lms_api/rb_urls.erb", nil, nil, nil, nil, nil, lms_urls_rb, nil).save("#{project_root}/lib/lms/canvas_urls.rb")
      Render.new("./lms_api/js_urls.erb", nil, nil, nil, nil, nil, lms_urls_js, nil).save("#{atomic_lti}/lib/canvas/urls.js")

      # GraphQL - still not complete
      Render.new("./lms_api/graphql_types.erb", nil, nil, nil, nil, nil, models.compact, nil).save("#{atomic_lti}/lib/canvas/graphql_types.js")
      Render.new("./lms_api/graphql_queries.erb", nil, nil, nil, nil, nil, queries, nil).save("#{atomic_lti}/lib/canvas/graphql_queries.js")
      Render.new("./lms_api/graphql_mutations.erb", nil, nil, nil, nil, nil, mutations, nil).save("#{atomic_lti}/lib/canvas/graphql_mutations.js")
    end

  end

  desc "Scrape the LMS api"
  task :api do
    LMSApiBuilder.build
  end
end
