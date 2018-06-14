require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RedirectToRootOutcomeGroupForContextCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "REDIRECT_TO_ROOT_OUTCOME_GROUP_FOR_CONTEXT_COURSES",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end