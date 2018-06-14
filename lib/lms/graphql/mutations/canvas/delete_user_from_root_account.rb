require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteUserFromRootAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :user_id, String, required: true
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(account_id:, user_id:)
            ctx[:canvas_api].proxy(
              "DELETE_USER_FROM_ROOT_ACCOUNT",
              {
                "account_id": account_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end