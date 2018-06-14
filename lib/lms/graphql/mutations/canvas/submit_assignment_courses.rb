require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SubmitAssignmentCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :comment_text_comment, String, required: false
          argument :submission_submission_type, String, required: true
          argument :submission_body, String, required: false
          argument :submission_url, String, required: false
          argument :submission_file_ids, Int, required: false
          argument :submission_media_comment_id, String, required: false
          argument :submission_media_comment_type, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, assignment_id:, comment_text_comment: nil, submission_submission_type:, submission_body: nil, submission_url: nil, submission_file_ids: nil, submission_media_comment_id: nil, submission_media_comment_type: nil)
            ctx[:canvas_api].proxy(
              "SUBMIT_ASSIGNMENT_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "comment[text_comment]": comment_text_comment,
                "submission[submission_type]": submission_submission_type,
                "submission[body]": submission_body,
                "submission[url]": submission_url,
                "submission[file_ids]": submission_file_ids,
                "submission[media_comment_id]": submission_media_comment_id,
                "submission[media_comment_type]": submission_media_comment_type              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end