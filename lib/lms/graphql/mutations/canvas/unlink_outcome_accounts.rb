require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UnlinkOutcomeAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          argument :outcome_id, String, required: true
          field :outcome_link, LMS::GraphQL::Types::Canvas::OutcomeLink, null: false
          def resolve(account_id:, id:, outcome_id:)
            ctx[:canvas_api].proxy(
              "UNLINK_OUTCOME_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id,
                "outcome_id": outcome_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end