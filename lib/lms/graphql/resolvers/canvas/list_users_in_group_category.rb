require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUsersInGroupCategory < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::User], null: false
          argument :group_category_id, ID, required: true
          argument :search_term, String, required: false
          argument :unassigned, Boolean, required: false
          def resolve(group_category_id:, search_term: nil, unassigned: nil)
            context[:canvas_api].proxy(
              "LIST_USERS_IN_GROUP_CATEGORY",
              {
                "group_category_id": group_category_id,
                "search_term": search_term,
                "unassigned": unassigned              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end