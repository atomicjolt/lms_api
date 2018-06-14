require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SelectProvisionalGrade < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :provisional_grade_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, assignment_id:, provisional_grade_id:)
            ctx[:canvas_api].proxy(
              "SELECT_PROVISIONAL_GRADE",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "provisional_grade_id": provisional_grade_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end