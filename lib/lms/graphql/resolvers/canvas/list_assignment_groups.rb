require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAssignmentGroup < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::AssignmentGroup], null: false
          argument :course_id, ID, required: true
          argument :include, String, required: false
          argument :exclude_assignment_submission_types, String, required: false
          argument :override_assignment_dates, Boolean, required: false
          argument :grading_period_id, ID, required: false
          argument :scope_assignments_to_student, Boolean, required: false
          def resolve(course_id:, include: nil, exclude_assignment_submission_types: nil, override_assignment_dates: nil, grading_period_id: nil, scope_assignments_to_student: nil)
            context[:canvas_api].proxy(
              "LIST_ASSIGNMENT_GROUPS",
              {
                "course_id": course_id,
                "include": include,
                "exclude_assignment_submission_types": exclude_assignment_submission_types,
                "override_assignment_dates": override_assignment_dates,
                "grading_period_id": grading_period_id,
                "scope_assignments_to_student": scope_assignments_to_student              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end