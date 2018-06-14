require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_override"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeletePlannerOverride < CanvasBaseMutation
          argument :id, ID, required: true
          field :planner_override, LMS::GraphQL::Types::Canvas::PlannerOverride, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "DELETE_PLANNER_OVERRIDE",
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