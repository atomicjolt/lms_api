require_relative "../canvas_base_type"
require_relative "page_view_link"

module LMS
  module GraphQL
    module Types
      module Canvas
        class PageView < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :id, ID, "A UUID representing the page view.  This is also the unique request id.Example: 3e246700-e305-0130-51de-02e33aa501ef", null: true
          field :app_name, String, "If the request is from an API request, the app that generated the access token.Example: Canvas for iOS", null: true
          field :url, String, "The URL requested.Example: https://canvas.instructure.com/conversations", null: true
          field :context_type, String, "The type of context for the request.Example: Course", null: true
          field :asset_type, String, "The type of asset in the context for the request, if any.Example: Discussion", null: true
          field :controller, String, "The rails controller that handled the request.Example: discussions", null: true
          field :action, String, "The rails action that handled the request.Example: index", null: true
          field :contributed, Boolean, "This field is deprecated, and will always be false.Example: false", null: true
          field :interaction_seconds, Float, "An approximation of how long the user spent on the page, in seconds.Example: 7.21", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When the request was made.Example: 2013-10-01T19:49:47Z", null: true
          field :user_request, Boolean, "A flag indicating whether the request was user-initiated, or automatic (such as an AJAX call).Example: true", null: true
          field :render_time, Float, "How long the response took to render, in seconds.Example: 0.369", null: true
          field :user_agent, String, "The user-agent of the browser or program that made the request.Example: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1", null: true
          field :participated, Boolean, "True if the request counted as participating, such as submitting homework.Example: false", null: true
          field :http_method, String, "The HTTP method such as GET or POST.Example: GET", null: true
          field :remote_ip, String, "The origin IP address of the request.Example: 173.194.46.71", null: true
          field :links, LMS::GraphQL::Types::Canvas::PageViewLink, "The page view links to define the relationships.Example: 1234, 1234", null: true

        end
      end
    end
  end
end