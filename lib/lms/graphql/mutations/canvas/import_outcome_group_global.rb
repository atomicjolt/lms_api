require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ImportOutcomeGroupGlobal < CanvasBaseMutation
          argument :id, String, required: true
          argument :source_outcome_group_id, Int, required: true
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(id:, source_outcome_group_id:)
            ctx[:canvas_api].proxy(
              "IMPORT_OUTCOME_GROUP_GLOBAL",
              {
                "id": id,
                "source_outcome_group_id": source_outcome_group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end