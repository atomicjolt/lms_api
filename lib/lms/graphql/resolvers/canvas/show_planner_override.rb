require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_override"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowPlannerOverride < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::PlannerOverride, null: false
          argument :id, ID, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "SHOW_PLANNER_OVERRIDE",
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