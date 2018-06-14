require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateNewRole < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :label, String, required: true
          argument :role, String, required: false
          argument :base_role_type, String, required: false
          argument :permissions__x__explicit, Boolean, required: false
          argument :permissions__x__enabled, Boolean, required: false
          argument :permissions__x__locked, Boolean, required: false
          argument :permissions__x__applies_to_self, Boolean, required: false
          argument :permissions__x__applies_to_descendants, Boolean, required: false
          field :role, LMS::GraphQL::Types::Canvas::Role, null: false
          def resolve(account_id:, label:, role: nil, base_role_type: nil, permissions__x__explicit: nil, permissions__x__enabled: nil, permissions__x__locked: nil, permissions__x__applies_to_self: nil, permissions__x__applies_to_descendants: nil)
            ctx[:canvas_api].proxy(
              "CREATE_NEW_ROLE",
              {
                "account_id": account_id,
                "label": label,
                "role": role,
                "base_role_type": base_role_type,
                "permissions[<X>][explicit]": permissions__x__explicit,
                "permissions[<X>][enabled]": permissions__x__enabled,
                "permissions[<X>][locked]": permissions__x__locked,
                "permissions[<X>][applies_to_self]": permissions__x__applies_to_self,
                "permissions[<X>][applies_to_descendants]": permissions__x__applies_to_descendants              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end