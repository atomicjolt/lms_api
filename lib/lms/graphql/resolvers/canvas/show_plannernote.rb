require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowPlannernote < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::PlannerNote, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "SHOW_PLANNERNOTE",
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