require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowOutcomeGroupGlobal < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "SHOW_OUTCOME_GROUP_GLOBAL",
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