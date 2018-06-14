require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGradingStandardsAvailableInContextCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::GradingStandard], null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_COURSES",
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