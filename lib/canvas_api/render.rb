require "canvas_api/helpers"
require "canvas_api/js_graphql_helpers"
require "canvas_api/js_helpers"
require "canvas_api/ruby_helpers"
require "canvas_api/rb_graphql_helpers"
require "canvas_api/go_helpers"
require "byebug"

module CanvasApi

  class Render
    include CanvasApi
    include CanvasApi::GraphQLHelpers
    include CanvasApi::JsHelpers
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

        if nickname == "save_enabled_account_calendars_creates_and_updates_enabled_account_calendars_and_mark_feature_as_seen_user_preferences_argument_mark_feature_as_seen_optional_boolean_flag_to_mark_account_calendars_feature_as_seen_argument_enabled_account_calendars_optional_array_array_of_account_ids_to_remember_in_calendars_list_of_user_curl_https_canvas_api_v_calendar_events_save_enabled_account_calendars_x_post_f_mark_feature_as_seen_true_f_enabled_account_calendars_f_enabled_account_calendars_h_authorization_bearer_token"
          nickname = "save_enabled_account_calendars"
        end

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
