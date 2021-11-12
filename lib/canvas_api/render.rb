require "canvas_api/helpers"
require "canvas_api/js_graphql_helpers"
require "canvas_api/js_helpers"
require "canvas_api/ts_helpers"
require "canvas_api/ruby_helpers"
require "canvas_api/rb_graphql_helpers"
require "canvas_api/go_helpers"
require "byebug"

module CanvasApi

  class Render
    include CanvasApi
    include CanvasApi::GraphQLHelpers
    include CanvasApi::JsHelpers
    include CanvasApi::TsHelpers
    include CanvasApi::RubyHelpers
    include CanvasApi::GoHelpers
    attr_accessor :template, :description, :resource, :api_url, :operation,
                  :args, :method, :api, :name, :resource_name, :resource_api,
                  :nickname, :notes, :content, :summary, :model, :model_name

    def initialize(template, api, resource, resource_api, operation, parameters, content, model, api_path)
      @template = File.read(File.expand_path(template, __dir__))
      @api_path = api_path
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
        # Keep a copy of full parameters for code that will include the description
        @full_parameters = Marshal.load Marshal::dump(parameters)
        # Strip description from parameters so that canvas_urls.rb
        # doesn't error out on bad chars in the descriptions
        tmp_params = Marshal.load Marshal::dump(parameters)
        @parameters = tmp_params.map { |p| p.delete("description"); p }
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

end
