require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AssignUnassignedMember < CanvasBaseMutation
          argument :group_category_id, String, required: true
          argument :sync, Boolean, required: false
          field :group_membership, LMS::GraphQL::Types::Canvas::GroupMembership, null: false
          def resolve(group_category_id:, sync: nil)
            ctx[:canvas_api].proxy(
              "ASSIGN_UNASSIGNED_MEMBERS",
              {
                "group_category_id": group_category_id,
                "sync": sync              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end