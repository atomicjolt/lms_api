require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class LeaveGroupMembership < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :membership_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, membership_id:)
            ctx[:canvas_api].proxy(
              "LEAVE_GROUP_MEMBERSHIPS",
              {
                "group_id": group_id,
                "membership_id": membership_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end