require "canvas_api/render"
require "byebug"
require "set"

module CanvasApi

  class Builder

    #
    # project_root: This is the directory where the canvas_urls.rb file will be written.
    # This file contains all urls and functions for access to the Canvas API from this gem (lms_api).
    # client_app_path: This where all client side Javascript for accessing the Canvas API will be written.
    # server_app_path: This is where all server side Javascript for accessing the Canvas API will be written.
    # Currently, this is generating GraphQL for Javascript and Ruby
    #
    def self.build(project_root, client_app_path, server_app_path, elixir_app_path, rb_graphql_app_path, go_app_path)
      endpoint = "https://canvas.instructure.com/doc/api"
      directory = HTTParty.get("#{endpoint}/api-docs.json")

      lms_urls_rb = []
      lms_urls_js = []
      lms_urls_ex = []
      course_ids_required_rb = []
      models = []
      js_graphql_queries = []
      js_graphql_mutations = []

      rb_graphql_fields = []
      rb_graphql_mutations = []
      rb_forward_declarations = []

      nicknames = []

      # Elixir has a default action that raises
      lms_urls_ex << CanvasApi::Render.new("./templates/ex_default_action.erb", nil, nil, nil, nil, nil, nil, nil, "").render

      directory["apis"].each do |api|
        puts "Generating #{api['description']}"
        api_path = api['path']
        resource = HTTParty.get("#{endpoint}#{api_path}")

        # HACK The canvas docs are missing one of the allowable value in modules
        # TODO we might want to create a hacks class at some point to contain all these
        if api_path == "/modules.json"
          if !resource["models"]["CompletionRequirement"]["properties"]["type"]["allowableValues"]["values"].include?("must_mark_done")
            resource["models"]["CompletionRequirement"]["properties"]["type"]["allowableValues"]["values"].push("must_mark_done")
          end
        end

        models = []
        resource["models"].map do |name, model|
          models << name

          if model["properties"] # Don't generate models without properties
            models << CanvasApi::Render.new("./templates/js_graphql_model.erb", api, resource, nil, nil, nil, nil, model, api_path).render
          end

          # Generate one file for each Canvas graphql type
          canvas_graphql_type_render = CanvasApi::Render.new("./templates/rb_graphql_type.erb", api, resource, nil, nil, nil, nil, model, api_path)
          canvas_graphql_type_render.save("#{rb_graphql_app_path}/lib/lms_graphql/types/canvas/#{model['id'].underscore.singularize}.rb")

          canvas_graphql_input_render = CanvasApi::Render.new("./templates/rb_graphql_input_type.erb", api, resource, nil, nil, nil, nil, model, api_path)
          canvas_graphql_input_render.save("#{rb_graphql_app_path}/lib/lms_graphql/types/canvas/#{model['id'].underscore.singularize}_input.rb")

          # Generate go structs
          go_type_render = CanvasApi::Render.new("./templates/go_struct.erb", api, resource, nil, nil, nil, nil, model, api_path)
          go_type_render.save("#{go_app_path}/models/#{model['id'].underscore}.go")

          rb_forward_declarations << "class Canvas#{model['id'].singularize}Input < BaseInputObject;end"
          rb_forward_declarations << "class Canvas#{model['id'].singularize} < BaseType;end"
        end

        constants = []
        resource["apis"]&.each do |resource_api|
          resource_api["operations"].each do |operation|

            # Prevent duplicates
            nickname = operation["nickname"]
            if nicknames.include?(nickname)
              nickname = "#{api["description"].gsub(" ", "_").downcase}_#{nickname}"
            end
            nicknames << nickname
            operation["nickname"] = nickname

            parameters = filter_duplicate_parameters(operation["parameters"])
            constants << CanvasApi::Render.new("./templates/constant.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            lms_urls_rb << CanvasApi::Render.new("./templates/rb_url.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            lms_urls_js << CanvasApi::Render.new("./templates/js_url.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            lms_urls_ex << CanvasApi::Render.new("./templates/ex_url.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            lms_urls_ex << CanvasApi::Render.new("./templates/ex_action.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render

            if parameters.detect{ |param| param["name"] == "course_id" && param["paramType"] == "path" }
              course_ids_required_rb << CanvasApi::Render.new("./templates/course_id_required.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            end

            begin
              go_action_renderer = CanvasApi::Render.new("./templates/go_action.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path)
              go_action_renderer.save("#{go_app_path}/requests/#{go_action_renderer.nickname}.go")
            rescue => ex
              byebug
              puts ex
            end

            if operation["method"].casecmp("GET") == 0
              js_graphql_queries << CanvasApi::Render.new("./templates/js_graphql_query.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render

              # One file per Canvas graphql resolver
              canvas_graphql_resolver_renderer = CanvasApi::Render.new("./templates/rb_graphql_resolver.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path)
              canvas_graphql_resolver_renderer.save("#{rb_graphql_app_path}/lib/lms_graphql/resolvers/canvas/#{canvas_graphql_resolver_renderer.nickname}.rb")
              rb_graphql_fields << CanvasApi::Render.new("./templates/rb_graphql_field.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            else
              js_graphql_mutations << CanvasApi::Render.new("./templates/js_graphql_mutation.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render

              rb_graphql_mutation_renderer = CanvasApi::Render.new("./templates/rb_graphql_mutation.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path)
              rb_graphql_mutation_renderer.save("#{rb_graphql_app_path}/lib/lms_graphql/mutations/canvas/#{rb_graphql_mutation_renderer.nickname}.rb")
              rb_graphql_mutations << CanvasApi::Render.new("./templates/rb_graphql_mutation_include.erb", api, resource, resource_api, operation, parameters, nil, nil, api_path).render
            end

          end
        end

        # Generate one file of constants for every LMS API
        constants_renderer = CanvasApi::Render.new("./templates/constants.erb", api, resource, nil, nil, nil, constants, nil, api_path)
        constants_renderer.save("#{client_app_path}/#{constants_renderer.name}.js")
      end

      CanvasApi::Render.new("./templates/rb_urls.erb", nil, nil, nil, nil, nil, lms_urls_rb, nil, "").save("#{project_root}/lib/lms/canvas_urls.rb")
      CanvasApi::Render.new("./templates/js_urls.erb", nil, nil, nil, nil, nil, lms_urls_js, nil, "").save("#{server_app_path}/lib/canvas/urls.js")

      # The elixir urls are sorted, to prevent linter errors
      CanvasApi::Render.new("./templates/ex_urls.erb", nil, nil, nil, nil, nil, lms_urls_ex.sort, nil, "").save("#{elixir_app_path}/lib/canvas/actions.ex")

      CanvasApi::Render.new("./templates/course_ids_required.erb", nil, nil, nil, nil, nil, course_ids_required_rb, nil, "").save("#{project_root}/lib/lms/course_ids_required.rb")

      # GraphQL Javascript - still not complete
      CanvasApi::Render.new("./templates/js_graphql_types.erb", nil, nil, nil, nil, nil, models.compact, nil, "").save("#{server_app_path}/lib/canvas/graphql_types.js")
      CanvasApi::Render.new("./templates/js_graphql_queries.erb", nil, nil, nil, nil, nil, js_graphql_queries, nil, "").save("#{server_app_path}/lib/canvas/graphql_queries.js")
      CanvasApi::Render.new("./templates/js_graphql_mutations.erb", nil, nil, nil, nil, nil, js_graphql_mutations, nil, "").save("#{server_app_path}/lib/canvas/graphql_mutations.js")

      # GraphQL Ruby
      CanvasApi::Render.new("./templates/rb_forward_declarations.erb", nil, nil, nil, nil, nil, rb_forward_declarations, nil, "").save("#{rb_graphql_app_path}/lib/lms_graphql/types/canvas_forward_declarations.rb")
      CanvasApi::Render.new("./templates/rb_graphql_root_query.erb", nil, nil, nil, nil, nil, rb_graphql_fields, nil, "").save("#{rb_graphql_app_path}/lib/lms_graphql/types/canvas/query_type.rb")
      CanvasApi::Render.new("./templates/rb_graphql_mutations.erb", nil, nil, nil, nil, nil, rb_graphql_mutations, nil, "").save("#{rb_graphql_app_path}/lib/lms_graphql/mutations/canvas/mutations.rb")
    end

    def self.filter_duplicate_parameters(parameters)
      # Canvas placed a deprecation warning
      # at the bottom of their documentation
      # for editing an assignment. This caused
      # us to create two instances of that specific field
      # this will filter that out (and ony other instances where they might do that)
      names = Set.new
      parameters.select do |param|
        included = names.include? param["name"]
        names.add(param["name"]) if !included
        !included
      end
    end
  end
end



