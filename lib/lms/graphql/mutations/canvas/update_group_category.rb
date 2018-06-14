require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/group_category"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateGroupCategory < CanvasBaseMutation
          argument :group_category_id, ID, required: true
          argument :name, String, required: false
          argument :self_signup, String, required: false
          argument :auto_leader, String, required: false
          argument :group_limit, Int, required: false
          argument :sis_group_category_id, ID, required: false
          argument :create_group_count, Int, required: false
          argument :split_group_count, String, required: false
          field :group_category, LMS::GraphQL::Types::Canvas::GroupCategory, null: false
          def resolve(group_category_id:, name: nil, self_signup: nil, auto_leader: nil, group_limit: nil, sis_group_category_id: nil, create_group_count: nil, split_group_count: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_GROUP_CATEGORY",
              {
                "group_category_id": group_category_id,
                "name": name,
                "self_signup": self_signup,
                "auto_leader": auto_leader,
                "group_limit": group_limit,
                "sis_group_category_id": sis_group_category_id,
                "create_group_count": create_group_count,
                "split_group_count": split_group_count              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end