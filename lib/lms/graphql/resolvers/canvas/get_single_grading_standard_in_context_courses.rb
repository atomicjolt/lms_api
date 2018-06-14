require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleGradingStandardInContextCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::GradingStandard, null: false
          argument :course_id, ID, required: true
          argument :grading_standard_id, ID, required: true
          def resolve(course_id:, grading_standard_id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_COURSES",
              {
                "course_id": course_id,
                "grading_standard_id": grading_standard_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end