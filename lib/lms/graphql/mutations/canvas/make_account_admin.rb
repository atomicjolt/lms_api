require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/admin"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class MakeAccountAdmin < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :user_id, Int, required: true
          argument :role, String, required: false
          argument :role_id, Int, required: false
          argument :send_confirmation, Boolean, required: false
          field :admin, LMS::GraphQL::Types::Canvas::Admin, null: false
          def resolve(account_id:, user_id:, role: nil, role_id: nil, send_confirmation: nil)
            ctx[:canvas_api].proxy(
              "MAKE_ACCOUNT_ADMIN",
              {
                "account_id": account_id,
                "user_id": user_id,
                "role": role,
                "role_id": role_id,
                "send_confirmation": send_confirmation              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end