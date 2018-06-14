require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleGroupMembershipUser < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::GroupMembership, null: false
          argument :group_id, String, required: true
          argument :user_id, String, required: true
          def resolve(group_id:, user_id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_GROUP_MEMBERSHIP_USERS",
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