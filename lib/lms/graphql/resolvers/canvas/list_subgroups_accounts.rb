require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListSubgroupsAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::OutcomeGroup], null: false
          argument :account_id, String, required: true
          argument :id, String, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "LIST_SUBGROUPS_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end