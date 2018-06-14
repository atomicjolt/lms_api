require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PageViewLink < BaseType
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
          field :user, Int, "The ID of the user for this page view.Example: 1234", null: true
          field :context, Int, "The ID of the context for the request (course id if context_type is Course, etc).Example: 1234", null: true
          field :asset, Int, "The ID of the asset for the request, if any.Example: 1234", null: true
          field :real_user, Int, "The ID of the actual user who made this request, if the request was made by a user who was masquerading.Example: 1234", null: true
          field :account, Int, "The ID of the account context for this page view.Example: 1234", null: true

        end
      end
    end
  end
end