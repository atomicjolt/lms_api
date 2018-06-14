require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteAssignmentOverride < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :id, String, required: true
          field :assignment_override, LMS::GraphQL::Types::Canvas::AssignmentOverride, null: false
          def resolve(course_id:, assignment_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_ASSIGNMENT_OVERRIDE",
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