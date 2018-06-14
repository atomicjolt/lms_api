require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GradeChangeLogQueryByCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::GradeChangeEvent], null: false
          argument :course_id, ID, required: true
          argument :start_time, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_time, LMS::GraphQL::Types::DateTimeType, required: false
          def resolve(course_id:, start_time: nil, end_time: nil)
            context[:canvas_api].proxy(
              "GRADE_CHANGE_LOG_QUERY_BY_COURSE",
              {
                "course_id": course_id,
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