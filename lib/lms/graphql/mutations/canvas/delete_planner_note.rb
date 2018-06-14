require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeletePlannerNote < CanvasBaseMutation
          argument :id, String, required: true
          field :planner_note, LMS::GraphQL::Types::Canvas::PlannerNote, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "DELETE_PLANNER_NOTE",
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