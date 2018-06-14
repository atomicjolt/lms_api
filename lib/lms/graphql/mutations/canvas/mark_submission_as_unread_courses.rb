require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class MarkSubmissionAsUnreadCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :user_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, assignment_id:, user_id:)
            ctx[:canvas_api].proxy(
              "MARK_SUBMISSION_AS_UNREAD_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end