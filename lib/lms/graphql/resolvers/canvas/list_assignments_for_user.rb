require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAssignmentsForUser < CanvasBaseResolver
          type Boolean, null: false
          argument :user_id, String, required: true
          argument :course_id, String, required: true
          def resolve(user_id:, course_id:)
            context[:canvas_api].proxy(
              "LIST_ASSIGNMENTS_FOR_USER",
              {
                "user_id": user_id,
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end