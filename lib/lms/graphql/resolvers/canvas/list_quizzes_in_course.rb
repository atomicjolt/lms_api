require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListQuizzesInCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Quiz], null: false
          argument :course_id, ID, required: true
          argument :search_term, String, required: false
          def resolve(course_id:, search_term: nil)
            context[:canvas_api].proxy(
              "LIST_QUIZZES_IN_COURSE",
              {
                "course_id": course_id,
                "search_term": search_term              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end