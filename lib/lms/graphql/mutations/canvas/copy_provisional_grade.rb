require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/provisional_grade"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CopyProvisionalGrade < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :provisional_grade_id, String, required: true
          field :provisional_grade, LMS::GraphQL::Types::Canvas::ProvisionalGrade, null: false
          def resolve(course_id:, assignment_id:, provisional_grade_id:)
            ctx[:canvas_api].proxy(
              "COPY_PROVISIONAL_GRADE",
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