require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetQuizReport < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::QuizReport, null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, quiz_id:, id:, include: nil)
            context[:canvas_api].proxy(
              "GET_QUIZ_REPORT",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end