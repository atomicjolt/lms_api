require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateNewCourse < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :course_name, String, required: false
          argument :course_course_code, String, required: false
          argument :course_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_license, String, required: false
          argument :course_is_public, Boolean, required: false
          argument :course_is_public_to_auth_users, Boolean, required: false
          argument :course_public_syllabus, Boolean, required: false
          argument :course_public_syllabus_to_auth, Boolean, required: false
          argument :course_public_description, String, required: false
          argument :course_allow_student_wiki_edits, Boolean, required: false
          argument :course_allow_wiki_comments, Boolean, required: false
          argument :course_allow_student_forum_attachments, Boolean, required: false
          argument :course_open_enrollment, Boolean, required: false
          argument :course_self_enrollment, Boolean, required: false
          argument :course_restrict_enrollments_to_course_dates, Boolean, required: false
          argument :course_term_id, Int, required: false
          argument :course_sis_course_id, String, required: false
          argument :course_integration_id, String, required: false
          argument :course_hide_final_grades, Boolean, required: false
          argument :course_apply_assignment_group_weights, Boolean, required: false
          argument :course_time_zone, String, required: false
          argument :offer, Boolean, required: false
          argument :enroll_me, Boolean, required: false
          argument :course_default_view, String, required: false
          argument :course_syllabus_body, String, required: false
          argument :course_grading_standard_id, Int, required: false
          argument :course_course_format, String, required: false
          argument :enable_sis_reactivation, Boolean, required: false
          field :course, LMS::GraphQL::Types::Canvas::Course, null: false
          def resolve(account_id:, course_name: nil, course_course_code: nil, course_start_at: nil, course_end_at: nil, course_license: nil, course_is_public: nil, course_is_public_to_auth_users: nil, course_public_syllabus: nil, course_public_syllabus_to_auth: nil, course_public_description: nil, course_allow_student_wiki_edits: nil, course_allow_wiki_comments: nil, course_allow_student_forum_attachments: nil, course_open_enrollment: nil, course_self_enrollment: nil, course_restrict_enrollments_to_course_dates: nil, course_term_id: nil, course_sis_course_id: nil, course_integration_id: nil, course_hide_final_grades: nil, course_apply_assignment_group_weights: nil, course_time_zone: nil, offer: nil, enroll_me: nil, course_default_view: nil, course_syllabus_body: nil, course_grading_standard_id: nil, course_course_format: nil, enable_sis_reactivation: nil)
            ctx[:canvas_api].proxy(
              "CREATE_NEW_COURSE",
              {
                "account_id": account_id,
                "course[name]": course_name,
                "course[course_code]": course_course_code,
                "course[start_at]": course_start_at,
                "course[end_at]": course_end_at,
                "course[license]": course_license,
                "course[is_public]": course_is_public,
                "course[is_public_to_auth_users]": course_is_public_to_auth_users,
                "course[public_syllabus]": course_public_syllabus,
                "course[public_syllabus_to_auth]": course_public_syllabus_to_auth,
                "course[public_description]": course_public_description,
                "course[allow_student_wiki_edits]": course_allow_student_wiki_edits,
                "course[allow_wiki_comments]": course_allow_wiki_comments,
                "course[allow_student_forum_attachments]": course_allow_student_forum_attachments,
                "course[open_enrollment]": course_open_enrollment,
                "course[self_enrollment]": course_self_enrollment,
                "course[restrict_enrollments_to_course_dates]": course_restrict_enrollments_to_course_dates,
                "course[term_id]": course_term_id,
                "course[sis_course_id]": course_sis_course_id,
                "course[integration_id]": course_integration_id,
                "course[hide_final_grades]": course_hide_final_grades,
                "course[apply_assignment_group_weights]": course_apply_assignment_group_weights,
                "course[time_zone]": course_time_zone,
                "offer": offer,
                "enroll_me": enroll_me,
                "course[default_view]": course_default_view,
                "course[syllabus_body]": course_syllabus_body,
                "course[grading_standard_id]": course_grading_standard_id,
                "course[course_format]": course_course_format,
                "enable_sis_reactivation": enable_sis_reactivation              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end