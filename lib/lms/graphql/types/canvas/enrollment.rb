require_relative "../canvas_base_type"
require_relative "grade"
require_relative "user"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Enrollment < BaseType
          description "Enrollments. API Docs: https://canvas.instructure.com/doc/api/enrollments.html"
          field :id, Int, "The ID of the enrollment..Example: 1", null: true
          field :course_id, Int, "The unique id of the course..Example: 1", null: true
          field :sis_course_id, String, "The SIS Course ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :course_integration_id, String, "The Course Integration ID in which the enrollment is associated. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :course_section_id, Int, "The unique id of the user's section..Example: 1", null: true
          field :section_integration_id, String, "The Section Integration ID in which the enrollment is associated. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :sis_account_id, String, "The SIS Account ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :sis_section_id, String, "The SIS Section ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :sis_user_id, String, "The SIS User ID in which the enrollment is associated. Only displayed if present. This field is only included if the user has permission to view SIS information..Example: SHEL93921", null: true
          field :enrollment_state, String, "The state of the user's enrollment in the course..Example: active", null: true
          field :limit_privileges_to_course_section, Boolean, "User can only access his or her own course section..Example: true", null: true
          field :sis_import_id, Int, "The unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..Example: 83", null: true
          field :root_account_id, Int, "The unique id of the user's account..Example: 1", null: true
          field :type, String, "The enrollment type. One of 'StudentEnrollment', 'TeacherEnrollment', 'TaEnrollment', 'DesignerEnrollment', 'ObserverEnrollment'..Example: StudentEnrollment", null: true
          field :user_id, Int, "The unique id of the user..Example: 1", null: true
          field :associated_user_id, Int, "The unique id of the associated user. Will be null unless type is ObserverEnrollment..", null: true
          field :role, String, "The enrollment role, for course-level permissions. This field will match `type` if the enrollment role has not been customized..Example: StudentEnrollment", null: true
          field :role_id, Int, "The id of the enrollment role..Example: 1", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "The created time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "The updated time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The start time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The end time of the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :last_activity_at, LMS::GraphQL::Types::DateTimeType, "The last activity time of the user for the enrollment, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :last_attended_at, LMS::GraphQL::Types::DateTimeType, "The last attended date of the user for the enrollment in a course, in ISO8601 format..Example: 2012-04-18T23:08:51Z", null: true
          field :total_activity_time, Int, "The total activity time of the user for the enrollment, in seconds..Example: 260", null: true
          field :html_url, String, "The URL to the Canvas web UI page for this course enrollment..Example: https://.", null: true
          field :grades, LMS::GraphQL::Types::Canvas::Grade, "The URL to the Canvas web UI page containing the grades associated with this enrollment..Example: https://., 35, , 6.67, ", null: true
          field :user, LMS::GraphQL::Types::Canvas::User, "A description of the user..Example: 3, Student 1, 1, Student, Stud 1", null: true
          field :computed_current_score, Float, "optional: The student's score in the course, ignoring ungraded assignments. (applies only to student enrollments, and only available in course endpoints).Example: 90.25", null: true
          field :computed_final_score, Float, "optional: The student's score in the course including ungraded assignments with a score of 0. (applies only to student enrollments, and only available in course endpoints).Example: 80.67", null: true
          field :computed_current_grade, String, "optional: The letter grade equivalent of computed_current_score, if available. (applies only to student enrollments, and only available in course endpoints).Example: A-", null: true
          field :computed_final_grade, String, "optional: The letter grade equivalent of computed_final_score, if available. (applies only to student enrollments, and only available in course endpoints).Example: B-", null: true
          field :unposted_current_grade, String, "The user's current grade in the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins..", null: true
          field :unposted_final_grade, String, "The user's final grade for the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins...", null: true
          field :unposted_current_score, String, "The user's current score in the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", null: true
          field :unposted_final_score, String, "The user's final score for the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", null: true
          field :has_grading_periods, Boolean, "optional: Indicates whether the course the enrollment belongs to has grading periods set up. (applies only to student enrollments, and only available in course endpoints).Example: true", null: true
          field :totals_for_all_grading_periods_option, Boolean, "optional: Indicates whether the course the enrollment belongs to has the Display Totals for 'All Grading Periods' feature enabled. (applies only to student enrollments, and only available in course endpoints).Example: true", null: true
          field :current_grading_period_title, String, "optional: The name of the currently active grading period, if one exists. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: Fall Grading Period", null: true
          field :current_grading_period_id, Int, "optional: The id of the currently active grading period, if one exists. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 5", null: true
          field :current_period_computed_current_score, Float, "optional: The student's score in the course for the current grading period, ignoring ungraded assignments. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 95.8", null: true
          field :current_period_computed_final_score, Float, "optional: The student's score in the course for the current grading period, including ungraded assignments with a score of 0. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 85.25", null: true
          field :current_period_computed_current_grade, String, "optional: The letter grade equivalent of current_period_computed_current_score, if available. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: A", null: true
          field :current_period_computed_final_grade, String, "optional: The letter grade equivalent of current_period_computed_final_score, if available. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: B", null: true
          field :current_period_unposted_current_score, Float, "optional: The student's score in the course for the current grading period, including muted/unposted assignments. Only included if user has permission to view this score, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 95.8", null: true
          field :current_period_unposted_final_score, Float, "optional: The student's score in the course for the current grading period, including muted/unposted assignments and including ungraded assignments with a score of 0. Only included if user has permission to view this score, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: 85.25", null: true
          field :current_period_unposted_current_grade, String, "optional: The letter grade equivalent of current_period_unposted_current_score, if available. Only included if user has permission to view this grade, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: A", null: true
          field :current_period_unposted_final_grade, String, "optional: The letter grade equivalent of current_period_unposted_final_score, if available. Only included if user has permission to view this grade, typically teachers, TAs, and admins. If the course the enrollment belongs to does not have grading periods, or if no currently active grading period exists, the value will be null. (applies only to student enrollments, and only available in course endpoints).Example: B", null: true

        end
      end
    end
  end
end