require_relative "../canvas_base_type"
require_relative "enrollment"
require_relative "calendar_link"
require_relative "term"
require_relative "course_progress"

module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "unpublished"
          value "available"
          value "completed"
          value "deleted"
        end

                class CourseDefaultViewEnum < ::GraphQL::Schema::Enum
          value "feed"
          value "wiki"
          value "modules"
          value "syllabus"
          value "assignments"
        end
        class Course < BaseType
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
          field :id, ID, "the unique identifier for the course.Example: 370663", null: true
          field :sis_course_id, ID, "the SIS identifier for the course, if defined. This field is only included if the user has permission to view SIS information..", null: true
          field :uuid, String, "the UUID of the course.Example: WvAHhY5FINzq5IyRIJybGeiXyFkG3SqHUPb7jZY5", null: true
          field :integration_id, ID, "the integration identifier for the course, if defined. This field is only included if the user has permission to view SIS information..", null: true
          field :sis_import_id, ID, "the unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..Example: 34", null: true
          field :name, String, "the full name of the course.Example: InstructureCon 2012", null: true
          field :course_code, String, "the course code.Example: INSTCON12", null: true
          field :workflow_state, CourseWorkflowStateEnum, "the current state of the course one of 'unpublished', 'available', 'completed', or 'deleted'.Example: available", null: true
          field :account_id, ID, "the account associated with the course.Example: 81259", null: true
          field :root_account_id, ID, "the root account associated with the course.Example: 81259", null: true
          field :enrollment_term_id, ID, "the enrollment term associated with the course.Example: 34", null: true
          field :grading_standard_id, ID, "the grading standard associated with the course.Example: 25", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "the start date for the course, if applicable.Example: 2012-06-01T00:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "the end date for the course, if applicable.Example: 2012-09-01T00:00:00-06:00", null: true
          field :locale, String, "the course-set locale, if applicable.Example: en", null: true
          field :enrollments, [LMS::GraphQL::Types::Canvas::Enrollment], "A list of enrollments linking the current user to the course. for student enrollments, grading information may be included if include[]=total_scores.", null: true
          field :total_students, Int, "optional: the total number of active and invited students in the course.Example: 32", null: true
          field :calendar, LMS::GraphQL::Types::Canvas::CalendarLink, "course calendar.", null: true
          field :default_view, CourseDefaultViewEnum, "the type of page that users will see when they first visit the course - 'feed': Recent Activity Dashboard - 'wiki': Wiki Front Page - 'modules': Course Modules/Sections Page - 'assignments': Course Assignments List - 'syllabus': Course Syllabus Page other types may be added in the future.Example: feed", null: true
          field :syllabus_body, String, "optional: user-generated HTML for the course syllabus.Example: <p>syllabus html goes here</p>", null: true
          field :needs_grading_count, Int, "optional: the number of submissions needing grading returned only if the current user has grading rights and include[]=needs_grading_count.Example: 17", null: true
          field :term, LMS::GraphQL::Types::Canvas::Term, "optional: the enrollment term object for the course returned only if include[]=term.", null: true
          field :course_progress, LMS::GraphQL::Types::Canvas::CourseProgress, "optional (beta): information on progress through the course returned only if include[]=course_progress.", null: true
          field :apply_assignment_group_weights, Boolean, "weight final grade based on assignment group percentages.Example: true", null: true
          field :permissions, String, "optional: the permissions the user has for the course. returned only for a single course and include[]=permissions.Example: true, true", null: true
          field :is_public, Boolean, "Example: true", null: true
          field :is_public_to_auth_users, Boolean, "Example: true", null: true
          field :public_syllabus, Boolean, "Example: true", null: true
          field :public_syllabus_to_auth, Boolean, "Example: true", null: true
          field :public_description, String, "optional: the public description of the course.Example: Come one, come all to InstructureCon 2012!", null: true
          field :storage_quota_mb, Int, "Example: 5", null: true
          field :storage_quota_used_mb, Float, "Example: 5", null: true
          field :hide_final_grades, Boolean, "", null: true
          field :license, String, "Example: Creative Commons", null: true
          field :allow_student_assignment_edits, Boolean, "", null: true
          field :allow_wiki_comments, Boolean, "", null: true
          field :allow_student_forum_attachments, Boolean, "", null: true
          field :open_enrollment, Boolean, "Example: true", null: true
          field :self_enrollment, Boolean, "", null: true
          field :restrict_enrollments_to_course_dates, Boolean, "", null: true
          field :course_format, String, "Example: online", null: true
          field :access_restricted_by_date, Boolean, "optional: this will be true if this user is currently prevented from viewing the course because of date restriction settings.", null: true
          field :time_zone, String, "The course's IANA time zone name..Example: America/Denver", null: true
          field :blueprint, Boolean, "optional: whether the course is set as a Blueprint Course (blueprint fields require the Blueprint Courses feature).Example: true", null: true
          field :blueprint_restrictions, String, "optional: Set of restrictions applied to all locked course objects.Example: true, true, false, false", null: true
          field :blueprint_restrictions_by_object_type, String, "optional: Sets of restrictions differentiated by object type applied to locked course objects.Example: {'content'=>true, 'points'=>true}, {'content'=>true}", null: true

        end
      end
    end
  end
end