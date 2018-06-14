require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class GradeOrCommentOnSubmissionCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :user_id, ID, required: true
          argument :comment_text_comment, String, required: false
          argument :comment_group_comment, Boolean, required: false
          argument :comment_media_comment_id, String, required: false
          argument :comment_media_comment_type, String, required: false
          argument :comment_file_ids, Int, required: false
          argument :include_visibility, String, required: false
          argument :submission_posted_grade, String, required: false
          argument :submission_excuse, Boolean, required: false
          argument :submission_late_policy_status, String, required: false
          argument :submission_seconds_late_override, Int, required: false
          argument :rubric_assessment, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, assignment_id:, user_id:, comment_text_comment: nil, comment_group_comment: nil, comment_media_comment_id: nil, comment_media_comment_type: nil, comment_file_ids: nil, include_visibility: nil, submission_posted_grade: nil, submission_excuse: nil, submission_late_policy_status: nil, submission_seconds_late_override: nil, rubric_assessment: nil)
            ctx[:canvas_api].proxy(
              "GRADE_OR_COMMENT_ON_SUBMISSION_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "user_id": user_id,
                "comment[text_comment]": comment_text_comment,
                "comment[group_comment]": comment_group_comment,
                "comment[media_comment_id]": comment_media_comment_id,
                "comment[media_comment_type]": comment_media_comment_type,
                "comment[file_ids]": comment_file_ids,
                "include[visibility]": include_visibility,
                "submission[posted_grade]": submission_posted_grade,
                "submission[excuse]": submission_excuse,
                "submission[late_policy_status]": submission_late_policy_status,
                "submission[seconds_late_override]": submission_seconds_late_override,
                "rubric_assessment": rubric_assessment              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end