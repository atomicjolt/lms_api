require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CompleteQuizSubmissionTurnItIn < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :id, String, required: true
          argument :attempt, Int, required: true
          argument :validation_token, String, required: true
          argument :access_code, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, quiz_id:, id:, attempt:, validation_token:, access_code: nil)
            ctx[:canvas_api].proxy(
              "COMPLETE_QUIZ_SUBMISSION_TURN_IT_IN",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id,
                "attempt": attempt,
                "validation_token": validation_token,
                "access_code": access_code              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end