require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGradingPeriodsCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_GRADING_PERIODS_COURSES",
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