require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPlannerItem < CanvasBaseResolver
          type Boolean, null: false
          argument :start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :filter, String, required: false
          def resolve(start_date: nil, end_date: nil, filter: nil)
            context[:canvas_api].proxy(
              "LIST_PLANNER_ITEMS",
              {
                "start_date": start_date,
                "end_date": end_date,
                "filter": filter              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end