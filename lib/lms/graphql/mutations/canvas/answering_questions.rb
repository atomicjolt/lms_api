require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz_submission_question"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AnsweringQuestion < CanvasBaseMutation
          argument :quiz_submission_id, String, required: true
          argument :attempt, Int, required: true
          argument :validation_token, String, required: true
          argument :access_code, String, required: false
          argument :quiz_questions, [LMS::GraphQL::Types::Canvas::QuizSubmissionQuestion], required: false
          field :quiz_submission_question, [LMS::GraphQL::Types::Canvas::QuizSubmissionQuestion], null: false
          def resolve(quiz_submission_id:, attempt:, validation_token:, access_code: nil, quiz_questions: nil)
            ctx[:canvas_api].proxy(
              "ANSWERING_QUESTIONS",
              {
                "quiz_submission_id": quiz_submission_id,
                "attempt": attempt,
                "validation_token": validation_token,
                "access_code": access_code,
                "quiz_questions": quiz_questions              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end