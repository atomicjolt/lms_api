require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddsLastAttendedDateToStudentEnrollmentInCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :user_id, String, required: true
          field :enrollment, LMS::GraphQL::Types::Canvas::Enrollment, null: false
          def resolve(course_id:, user_id:)
            ctx[:canvas_api].proxy(
              "ADDS_LAST_ATTENDED_DATE_TO_STUDENT_ENROLLMENT_IN_COURSE",
              {
                "course_id": course_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end