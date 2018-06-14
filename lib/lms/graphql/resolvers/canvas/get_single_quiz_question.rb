require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_question"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleQuizQuestion < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::QuizQuestion, null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :id, Int, required: true
          def resolve(course_id:, quiz_id:, id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_QUIZ_QUESTION",
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