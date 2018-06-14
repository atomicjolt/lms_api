require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllQuizSubmissionQuestion < CanvasBaseResolver
          type Boolean, null: false
          argument :quiz_submission_id, String, required: true
          argument :include, String, required: false
          def resolve(quiz_submission_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_ALL_QUIZ_SUBMISSION_QUESTIONS",
              {
                "quiz_submission_id": quiz_submission_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end