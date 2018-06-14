require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteQuiz < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          field :quiz, LMS::GraphQL::Types::Canvas::Quiz, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_QUIZ",
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