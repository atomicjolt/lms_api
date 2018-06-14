require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCourseLevelAssignmentDatum < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :async, Boolean, required: false
          def resolve(course_id:, async: nil)
            context[:canvas_api].proxy(
              "GET_COURSE_LEVEL_ASSIGNMENT_DATA",
              {
                "course_id": course_id,
                "async": async              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end