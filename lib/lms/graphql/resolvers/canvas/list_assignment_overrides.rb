require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAssignmentOverride < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::AssignmentOverride], null: false
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          def resolve(course_id:, assignment_id:)
            context[:canvas_api].proxy(
              "LIST_ASSIGNMENT_OVERRIDES",
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