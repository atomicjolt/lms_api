require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DestroyAssignmentGroup < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_group_id, String, required: true
          argument :move_assignments_to, Int, required: false
          field :assignment_group, LMS::GraphQL::Types::Canvas::AssignmentGroup, null: false
          def resolve(course_id:, assignment_group_id:, move_assignments_to: nil)
            ctx[:canvas_api].proxy(
              "DESTROY_ASSIGNMENT_GROUP",
              {
                "course_id": course_id,
                "assignment_group_id": assignment_group_id,
                "move_assignments_to": move_assignments_to              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end