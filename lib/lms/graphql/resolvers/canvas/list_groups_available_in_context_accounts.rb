require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGroupsAvailableInContextAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Group], null: false
          argument :account_id, String, required: true
          argument :only_own_groups, Boolean, required: false
          argument :include, String, required: false
          def resolve(account_id:, only_own_groups: nil, include: nil)
            context[:canvas_api].proxy(
              "LIST_GROUPS_AVAILABLE_IN_CONTEXT_ACCOUNTS",
              {
                "account_id": account_id,
                "only_own_groups": only_own_groups,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end