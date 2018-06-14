require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature_flag"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFeatureFlagUser < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::FeatureFlag, null: false
          argument :user_id, ID, required: true
          argument :feature, String, required: true
          def resolve(user_id:, feature:)
            context[:canvas_api].proxy(
              "GET_FEATURE_FLAG_USERS",
              {
                "user_id": user_id,
                "feature": feature              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end