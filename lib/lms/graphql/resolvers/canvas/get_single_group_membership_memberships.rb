require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_membership"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleGroupMembershipMembership < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::GroupMembership, null: false
          argument :group_id, String, required: true
          argument :membership_id, String, required: true
          def resolve(group_id:, membership_id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_GROUP_MEMBERSHIP_MEMBERSHIPS",
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