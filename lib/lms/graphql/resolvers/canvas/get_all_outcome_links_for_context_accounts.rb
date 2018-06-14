require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_link"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllOutcomeLinksForContextAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::OutcomeLink], null: false
          argument :account_id, ID, required: true
          argument :outcome_style, String, required: false
          argument :outcome_group_style, String, required: false
          def resolve(account_id:, outcome_style: nil, outcome_group_style: nil)
            context[:canvas_api].proxy(
              "GET_ALL_OUTCOME_LINKS_FOR_CONTEXT_ACCOUNTS",
              {
                "account_id": account_id,
                "outcome_style": outcome_style,
                "outcome_group_style": outcome_group_style              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end