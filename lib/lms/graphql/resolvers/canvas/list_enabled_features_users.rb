require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEnabledFeaturesUser < CanvasBaseResolver
          type Boolean, null: false
          argument :user_id, String, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_ENABLED_FEATURES_USERS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end