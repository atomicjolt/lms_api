require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowOutcome < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Outcome, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "SHOW_OUTCOME",
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