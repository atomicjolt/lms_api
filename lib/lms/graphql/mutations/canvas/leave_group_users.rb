require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class LeaveGroupUser < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :user_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, user_id:)
            ctx[:canvas_api].proxy(
              "LEAVE_GROUP_USERS",
              {
                "group_id": group_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end