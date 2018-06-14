require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/role"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateRole < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          argument :label, String, required: false
          argument :permissions__x__explicit, Boolean, required: false
          argument :permissions__x__enabled, Boolean, required: false
          argument :permissions__x__applies_to_self, Boolean, required: false
          argument :permissions__x__applies_to_descendants, Boolean, required: false
          field :role, LMS::GraphQL::Types::Canvas::Role, null: false
          def resolve(account_id:, id:, label: nil, permissions__x__explicit: nil, permissions__x__enabled: nil, permissions__x__applies_to_self: nil, permissions__x__applies_to_descendants: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_ROLE",
              {
                "account_id": account_id,
                "id": id,
                "label": label,
                "permissions[<X>][explicit]": permissions__x__explicit,
                "permissions[<X>][enabled]": permissions__x__enabled,
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