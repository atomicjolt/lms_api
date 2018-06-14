require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateAssignmentOverride < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :assignment_override_student_ids, Int, required: false
          argument :assignment_override_title, String, required: false
          argument :assignment_override_group_id, Int, required: false
          argument :assignment_override_course_section_id, Int, required: false
          argument :assignment_override_due_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :assignment_override_unlock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :assignment_override_lock_at, LMS::GraphQL::Types::DateTimeType, required: false
          field :assignment_override, LMS::GraphQL::Types::Canvas::AssignmentOverride, null: false
          def resolve(course_id:, assignment_id:, assignment_override_student_ids: nil, assignment_override_title: nil, assignment_override_group_id: nil, assignment_override_course_section_id: nil, assignment_override_due_at: nil, assignment_override_unlock_at: nil, assignment_override_lock_at: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ASSIGNMENT_OVERRIDE",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "assignment_override[student_ids]": assignment_override_student_ids,
                "assignment_override[title]": assignment_override_title,
                "assignment_override[group_id]": assignment_override_group_id,
                "assignment_override[course_section_id]": assignment_override_course_section_id,
                "assignment_override[due_at]": assignment_override_due_at,
                "assignment_override[unlock_at]": assignment_override_unlock_at,
                "assignment_override[lock_at]": assignment_override_lock_at              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end