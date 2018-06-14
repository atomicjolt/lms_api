require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_question"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListQuestionsInQuizOrSubmission < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::QuizQuestion], null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :quiz_submission_id, Int, required: false
          argument :quiz_submission_attempt, Int, required: false
          def resolve(course_id:, quiz_id:, quiz_submission_id: nil, quiz_submission_attempt: nil)
            context[:canvas_api].proxy(
              "LIST_QUESTIONS_IN_QUIZ_OR_SUBMISSION",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "quiz_submission_id": quiz_submission_id,
                "quiz_submission_attempt": quiz_submission_attempt              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end