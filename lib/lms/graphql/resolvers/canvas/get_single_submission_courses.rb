require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleSubmissionCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :user_id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, assignment_id:, user_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_SUBMISSION_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "user_id": user_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end