require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteOutcomeGroupGlobal < CanvasBaseMutation
          argument :id, String, required: true
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "DELETE_OUTCOME_GROUP_GLOBAL",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end