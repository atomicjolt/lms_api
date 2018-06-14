require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleAssignmentOverride < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::AssignmentOverride, null: false
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, assignment_id:, id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_ASSIGNMENT_OVERRIDE",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end