require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UnlinkOutcomeGlobal < CanvasBaseMutation
          argument :id, ID, required: true
          argument :outcome_id, ID, required: true
          field :outcome_link, LMS::GraphQL::Types::Canvas::OutcomeLink, null: false
          def resolve(id:, outcome_id:)
            ctx[:canvas_api].proxy(
              "UNLINK_OUTCOME_GLOBAL",
              {
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