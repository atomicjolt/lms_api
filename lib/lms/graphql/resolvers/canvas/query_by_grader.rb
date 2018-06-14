require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class QueryByGrader < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::GradeChangeEvent], null: false
          argument :grader_id, String, required: true
          argument :start_time, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_time, LMS::GraphQL::Types::DateTimeType, required: false
          def resolve(grader_id:, start_time: nil, end_time: nil)
            context[:canvas_api].proxy(
              "QUERY_BY_GRADER",
              {
                "grader_id": grader_id,
                "start_time": start_time,
                "end_time": end_time              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end