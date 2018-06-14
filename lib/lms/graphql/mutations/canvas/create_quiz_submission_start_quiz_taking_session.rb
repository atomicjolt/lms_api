require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateQuizSubmissionStartQuizTakingSession < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :access_code, String, required: false
          argument :preview, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, quiz_id:, access_code: nil, preview: nil)
            ctx[:canvas_api].proxy(
              "CREATE_QUIZ_SUBMISSION_START_QUIZ_TAKING_SESSION",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "access_code": access_code,
                "preview": preview              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end