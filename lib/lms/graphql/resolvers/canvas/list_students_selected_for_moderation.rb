require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListStudentsSelectedForModeration < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::User], null: false
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          def resolve(course_id:, assignment_id:)
            context[:canvas_api].proxy(
              "LIST_STUDENTS_SELECTED_FOR_MODERATION",
              {
                "course_id": course_id,
                "assignment_id": assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end