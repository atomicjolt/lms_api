require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCurrentQuizSubmissionTime < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :quiz_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, quiz_id:, id:)
            context[:canvas_api].proxy(
              "GET_CURRENT_QUIZ_SUBMISSION_TIMES",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end