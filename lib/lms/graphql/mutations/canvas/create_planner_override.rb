require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_override"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreatePlannerOverride < CanvasBaseMutation
          argument :plannable_type, String, required: false
          argument :plannable_id, Int, required: false
          argument :marked_complete, Boolean, required: false
          argument :dismissed, Boolean, required: false
          field :planner_override, LMS::GraphQL::Types::Canvas::PlannerOverride, null: false
          def resolve(plannable_type: nil, plannable_id: nil, marked_complete: nil, dismissed: nil)
            ctx[:canvas_api].proxy(
              "CREATE_PLANNER_OVERRIDE",
              {
                "plannable_type": plannable_type,
                "plannable_id": plannable_id,
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