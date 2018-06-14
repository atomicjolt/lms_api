require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class InviteOthersToGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :invitees, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, invitees:)
            ctx[:canvas_api].proxy(
              "INVITE_OTHERS_TO_GROUP",
              {
                "group_id": group_id,
                "invitees": invitees              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end