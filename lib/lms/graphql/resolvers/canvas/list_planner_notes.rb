require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPlannerNote < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PlannerNote], null: false
          argument :start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :context_codes, String, required: false
          def resolve(start_date: nil, end_date: nil, context_codes: nil)
            context[:canvas_api].proxy(
              "LIST_PLANNER_NOTES",
              {
                "start_date": start_date,
                "end_date": end_date,
                "context_codes": context_codes              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end