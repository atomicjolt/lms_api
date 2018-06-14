require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowOutcomeGroupAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_OUTCOME_GROUP_ACCOUNTS",
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