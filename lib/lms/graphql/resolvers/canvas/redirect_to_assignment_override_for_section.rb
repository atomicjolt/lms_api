require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RedirectToAssignmentOverrideForSection < CanvasBaseResolver
          type Boolean, null: false
          argument :course_section_id, ID, required: true
          argument :assignment_id, ID, required: true
          def resolve(course_section_id:, assignment_id:)
            context[:canvas_api].proxy(
              "REDIRECT_TO_ASSIGNMENT_OVERRIDE_FOR_SECTION",
              {
                "course_section_id": course_section_id,
                "assignment_id": assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end