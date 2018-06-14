require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAssignmentGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::AssignmentGroup, null: false
          argument :course_id, String, required: true
          argument :assignment_group_id, String, required: true
          argument :include, String, required: false
          argument :override_assignment_dates, Boolean, required: false
          argument :grading_period_id, Int, required: false
          def resolve(course_id:, assignment_group_id:, include: nil, override_assignment_dates: nil, grading_period_id: nil)
            context[:canvas_api].proxy(
              "GET_ASSIGNMENT_GROUP",
              {
                "course_id": course_id,
                "assignment_group_id": assignment_group_id,
                "include": include,
                "override_assignment_dates": override_assignment_dates,
                "grading_period_id": grading_period_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end