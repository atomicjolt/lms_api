require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature_flag"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFeatureFlagCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::FeatureFlag, null: false
          argument :course_id, String, required: true
          argument :feature, String, required: true
          def resolve(course_id:, feature:)
            context[:canvas_api].proxy(
              "GET_FEATURE_FLAG_COURSES",
              {
                "course_id": course_id,
                "feature": feature              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end