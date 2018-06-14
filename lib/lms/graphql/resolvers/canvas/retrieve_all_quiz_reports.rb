require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RetrieveAllQuizReport < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::QuizReport], null: false
          argument :course_id, ID, required: true
          argument :quiz_id, ID, required: true
          argument :includes_all_versions, Boolean, required: false
          def resolve(course_id:, quiz_id:, includes_all_versions: nil)
            context[:canvas_api].proxy(
              "RETRIEVE_ALL_QUIZ_REPORTS",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "includes_all_versions": includes_all_versions              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end