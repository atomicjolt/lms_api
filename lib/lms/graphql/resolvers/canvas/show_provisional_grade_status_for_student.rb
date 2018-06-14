require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowProvisionalGradeStatusForStudent < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :student_id, ID, required: false
          def resolve(course_id:, assignment_id:, student_id: nil)
            context[:canvas_api].proxy(
              "SHOW_PROVISIONAL_GRADE_STATUS_FOR_STUDENT",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "student_id": student_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end