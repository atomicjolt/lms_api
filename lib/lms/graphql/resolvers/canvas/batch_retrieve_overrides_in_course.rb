require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class BatchRetrieveOverridesInCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::AssignmentOverride], null: false
          argument :course_id, ID, required: true
          argument :assignment_overrides_id, String, required: true
          argument :assignment_overrides_assignment_id, String, required: true
          def resolve(course_id:, assignment_overrides_id:, assignment_overrides_assignment_id:)
            context[:canvas_api].proxy(
              "BATCH_RETRIEVE_OVERRIDES_IN_COURSE",
              {
                "course_id": course_id,
                "assignment_overrides[id]": assignment_overrides_id,
                "assignment_overrides[assignment_id]": assignment_overrides_assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end