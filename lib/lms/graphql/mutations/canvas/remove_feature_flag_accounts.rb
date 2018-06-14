require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RemoveFeatureFlagAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :feature, String, required: true
          field :feature_flag, LMS::GraphQL::Types::Canvas::FeatureFlag, null: false
          def resolve(account_id:, feature:)
            ctx[:canvas_api].proxy(
              "REMOVE_FEATURE_FLAG_ACCOUNTS",
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