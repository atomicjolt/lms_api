require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleAssignment < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Assignment, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :include, String, required: false
          argument :override_assignment_dates, Boolean, required: false
          argument :needs_grading_count_by_section, Boolean, required: false
          argument :all_dates, Boolean, required: false
          def resolve(course_id:, id:, include: nil, override_assignment_dates: nil, needs_grading_count_by_section: nil, all_dates: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_ASSIGNMENT",
              {
                "course_id": course_id,
                "id": id,
                "include": include,
                "override_assignment_dates": override_assignment_dates,
                "needs_grading_count_by_section": needs_grading_count_by_section,
                "all_dates": all_dates              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end