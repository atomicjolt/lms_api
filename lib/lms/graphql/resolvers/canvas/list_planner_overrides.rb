require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_override"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPlannerOverride < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PlannerOverride], null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_PLANNER_OVERRIDES",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end