require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAssignment < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Assignment], null: false
          argument :course_id, String, required: true
          argument :include, String, required: false
          argument :search_term, String, required: false
          argument :override_assignment_dates, Boolean, required: false
          argument :needs_grading_count_by_section, Boolean, required: false
          argument :bucket, String, required: false
          argument :assignment_ids, String, required: false
          argument :order_by, String, required: false
          def resolve(course_id:, include: nil, search_term: nil, override_assignment_dates: nil, needs_grading_count_by_section: nil, bucket: nil, assignment_ids: nil, order_by: nil)
            context[:canvas_api].proxy(
              "LIST_ASSIGNMENTS",
              {
                "course_id": course_id,
                "include": include,
                "search_term": search_term,
                "override_assignment_dates": override_assignment_dates,
                "needs_grading_count_by_section": needs_grading_count_by_section,
                "bucket": bucket,
                "assignment_ids": assignment_ids,
                "order_by": order_by              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end