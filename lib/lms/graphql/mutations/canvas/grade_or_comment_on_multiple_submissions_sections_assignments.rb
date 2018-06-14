require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class GradeOrCommentOnMultipleSubmissionsSectionsAssignment < CanvasBaseMutation
          argument :section_id, String, required: true
          argument :assignment_id, String, required: true
          argument :grade_data_<student_id>_posted_grade, String, required: false
          argument :grade_data_<student_id>_excuse, Boolean, required: false
          argument :grade_data_<student_id>_rubric_assessment, String, required: false
          argument :grade_data_<student_id>_text_comment, String, required: false
          argument :grade_data_<student_id>_group_comment, Boolean, required: false
          argument :grade_data_<student_id>_media_comment_id, String, required: false
          argument :grade_data_<student_id>_media_comment_type, String, required: false
          argument :grade_data_<student_id>_file_ids, Int, required: false
          argument :grade_data_<student_id>_assignment_id, Int, required: false
          field :progress, LMS::GraphQL::Types::Canvas::Progress, null: false
          def resolve(section_id:, assignment_id:, grade_data_<student_id>_posted_grade: nil, grade_data_<student_id>_excuse: nil, grade_data_<student_id>_rubric_assessment: nil, grade_data_<student_id>_text_comment: nil, grade_data_<student_id>_group_comment: nil, grade_data_<student_id>_media_comment_id: nil, grade_data_<student_id>_media_comment_type: nil, grade_data_<student_id>_file_ids: nil, grade_data_<student_id>_assignment_id: nil)
            ctx[:canvas_api].proxy(
              "GRADE_OR_COMMENT_ON_MULTIPLE_SUBMISSIONS_SECTIONS_ASSIGNMENTS",
              {
                "section_id": section_id,
                "assignment_id": assignment_id,
                "grade_data[<student_id>][posted_grade]": grade_data_<student_id>_posted_grade,
                "grade_data[<student_id>][excuse]": grade_data_<student_id>_excuse,
                "grade_data[<student_id>][rubric_assessment]": grade_data_<student_id>_rubric_assessment,
                "grade_data[<student_id>][text_comment]": grade_data_<student_id>_text_comment,
                "grade_data[<student_id>][group_comment]": grade_data_<student_id>_group_comment,
                "grade_data[<student_id>][media_comment_id]": grade_data_<student_id>_media_comment_id,
                "grade_data[<student_id>][media_comment_type]": grade_data_<student_id>_media_comment_type,
                "grade_data[<student_id>][file_ids]": grade_data_<student_id>_file_ids,
                "grade_data[<student_id>][assignment_id]": grade_data_<student_id>_assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end