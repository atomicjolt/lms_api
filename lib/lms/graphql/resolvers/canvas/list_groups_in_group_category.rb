require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGroupsInGroupCategory < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Group], null: false
          argument :group_category_id, String, required: true
          def resolve(group_category_id:)
            context[:canvas_api].proxy(
              "LIST_GROUPS_IN_GROUP_CATEGORY",
              {
                "group_category_id": group_category_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end