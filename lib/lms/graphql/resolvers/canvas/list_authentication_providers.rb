require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/authentication_provider"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAuthenticationProvider < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::AuthenticationProvider], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "LIST_AUTHENTICATION_PROVIDERS",
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