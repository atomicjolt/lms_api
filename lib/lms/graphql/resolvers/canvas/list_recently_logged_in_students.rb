require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListRecentlyLoggedInStudent < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::User], null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_RECENTLY_LOGGED_IN_STUDENTS",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end