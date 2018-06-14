require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class UserDisplay < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :id, ID, "The ID of the user..Example: 2", null: true
          field :short_name, String, "A short name the user has selected, for use in conversations or other less formal places through the site..Example: Shelly", null: true
          field :avatar_image_url, String, "If avatars are enabled, this field will be included and contain a url to retrieve the user's avatar..Example: https://en.gravatar.com/avatar/d8cb8c8cd40ddf0cd05241443a591868?s=80&r=g", null: true
          field :html_url, String, "URL to access user, either nested to a context or directly..Example: https://school.instructure.com/courses/:course_id/users/:user_id", null: true

        end
      end
    end
  end
end