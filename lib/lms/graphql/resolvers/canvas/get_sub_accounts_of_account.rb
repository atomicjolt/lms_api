require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSubAccountsOfAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Account], null: false
          argument :account_id, ID, required: true
          argument :recursive, Boolean, required: false
          def resolve(account_id:, recursive: nil)
            context[:canvas_api].proxy(
              "GET_SUB_ACCOUNTS_OF_ACCOUNT",
              {
                "account_id": account_id,
                "recursive": recursive              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end