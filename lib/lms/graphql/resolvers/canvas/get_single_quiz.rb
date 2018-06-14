require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleQuiz < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Quiz, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_QUIZ",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end