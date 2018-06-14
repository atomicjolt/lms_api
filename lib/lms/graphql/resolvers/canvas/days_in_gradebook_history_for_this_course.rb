require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/day"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class DaysInGradebookHistoryForThisCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Day], null: false
          argument :course_id, Int, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "DAYS_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end