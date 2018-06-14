require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_link"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListLinkedOutcomesAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::OutcomeLink], null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          argument :outcome_style, String, required: false
          def resolve(account_id:, id:, outcome_style: nil)
            context[:canvas_api].proxy(
              "LIST_LINKED_OUTCOMES_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id,
                "outcome_style": outcome_style              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end