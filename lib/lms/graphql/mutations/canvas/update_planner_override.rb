require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_override"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdatePlannerOverride < CanvasBaseMutation
          argument :id, ID, required: true
          argument :marked_complete, String, required: false
          argument :dismissed, String, required: false
          field :planner_override, LMS::GraphQL::Types::Canvas::PlannerOverride, null: false
          def resolve(id:, marked_complete: nil, dismissed: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_PLANNER_OVERRIDE",
              {
                "id": id,
                "marked_complete": marked_complete,
                "dismissed": dismissed              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end