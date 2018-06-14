require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RemoveFeatureFlagUser < CanvasBaseMutation
          argument :user_id, ID, required: true
          argument :feature, String, required: true
          field :feature_flag, LMS::GraphQL::Types::Canvas::FeatureFlag, null: false
          def resolve(user_id:, feature:)
            ctx[:canvas_api].proxy(
              "REMOVE_FEATURE_FLAG_USERS",
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