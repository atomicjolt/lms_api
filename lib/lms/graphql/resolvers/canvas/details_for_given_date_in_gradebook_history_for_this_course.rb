require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grader"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class DetailsForGivenDateInGradebookHistoryForThisCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Grader], null: false
          argument :course_id, Int, required: true
          argument :date, String, required: true
          def resolve(course_id:, date:)
            context[:canvas_api].proxy(
              "DETAILS_FOR_GIVEN_DATE_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE",
              {
                "course_id": course_id,
                "date": date              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end