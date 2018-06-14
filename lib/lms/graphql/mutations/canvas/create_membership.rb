require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_membership"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateMembership < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :user_id, ID, required: false
          field :group_membership, LMS::GraphQL::Types::Canvas::GroupMembership, null: false
          def resolve(group_id:, user_id: nil)
            ctx[:canvas_api].proxy(
              "CREATE_MEMBERSHIP",
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