require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EditAssignmentGroup < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :assignment_group_id, ID, required: true
          field :assignment_group, LMS::GraphQL::Types::Canvas::AssignmentGroup, null: false
          def resolve(course_id:, assignment_group_id:)
            ctx[:canvas_api].proxy(
              "EDIT_ASSIGNMENT_GROUP",
              {
                "course_id": course_id,
                "assignment_group_id": assignment_group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end