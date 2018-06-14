require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature_flag"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFeatureFlagAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::FeatureFlag, null: false
          argument :account_id, ID, required: true
          argument :feature, String, required: true
          def resolve(account_id:, feature:)
            context[:canvas_api].proxy(
              "GET_FEATURE_FLAG_ACCOUNTS",
              {
                "account_id": account_id,
                "feature": feature              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end