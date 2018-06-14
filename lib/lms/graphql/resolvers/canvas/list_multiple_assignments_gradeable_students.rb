require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListMultipleAssignmentsGradeableStudent < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :assignment_ids, [ID], required: false
          def resolve(course_id:, assignment_ids: nil)
            context[:canvas_api].proxy(
              "LIST_MULTIPLE_ASSIGNMENTS_GRADEABLE_STUDENTS",
              {
                "course_id": course_id,
                "assignment_ids": assignment_ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end