require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleQuizGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::QuizGroup, null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, quiz_id:, id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_QUIZ_GROUP",
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