require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteSubAccount < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          field :account, LMS::GraphQL::Types::Canvas::Account, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_SUB_ACCOUNT",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end