require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllOutcomeGroupsForContextAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::OutcomeGroup], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "GET_ALL_OUTCOME_GROUPS_FOR_CONTEXT_ACCOUNTS",
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