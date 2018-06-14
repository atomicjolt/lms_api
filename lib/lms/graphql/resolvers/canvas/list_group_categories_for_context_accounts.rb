require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGroupCategoriesForContextAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::GroupCategory], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "LIST_GROUP_CATEGORIES_FOR_CONTEXT_ACCOUNTS",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end