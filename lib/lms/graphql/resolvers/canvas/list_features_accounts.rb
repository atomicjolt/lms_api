require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListFeaturesAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Feature], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "LIST_FEATURES_ACCOUNTS",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end