require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ActivateRole < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          argument :role_id, ID, required: true
          argument :role, String, required: false
          field :role, LMS::GraphQL::Types::Canvas::Role, null: false
          def resolve(account_id:, id:, role_id:, role: nil)
            ctx[:canvas_api].proxy(
              "ACTIVATE_ROLE",
              {
                "account_id": account_id,
                "id": id,
                "role_id": role_id,
                "role": role              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end