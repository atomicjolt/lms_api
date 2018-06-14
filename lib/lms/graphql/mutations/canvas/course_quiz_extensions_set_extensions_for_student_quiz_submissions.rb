require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CourseQuizExtensionsSetExtensionsForStudentQuizSubmission < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :user_id, ID, required: true
          argument :extra_attempts, Int, required: false
          argument :extra_time, Int, required: false
          argument :manually_unlocked, Boolean, required: false
          argument :extend_from_now, Int, required: false
          argument :extend_from_end_at, Int, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, user_id:, extra_attempts: nil, extra_time: nil, manually_unlocked: nil, extend_from_now: nil, extend_from_end_at: nil)
            ctx[:canvas_api].proxy(
              "COURSE_QUIZ_EXTENSIONS_SET_EXTENSIONS_FOR_STUDENT_QUIZ_SUBMISSIONS",
              {
                "course_id": course_id,
                "user_id": user_id,
                "extra_attempts": extra_attempts,
                "extra_time": extra_time,
                "manually_unlocked": manually_unlocked,
                "extend_from_now": extend_from_now,
                "extend_from_end_at": extend_from_end_at              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end