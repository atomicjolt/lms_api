require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ReportParameterOrderEnum < ::GraphQL::Schema::Enum
          value "users"
          value "courses"
          value "outcomes"
        end
        class ReportParameter < BaseType
          description "Account Reports. API Docs: https://canvas.instructure.com/doc/api/account_reports.html"
          field :enrollment_term_id, ID, "The canvas id of the term to get grades from.Example: 2", null: true
          field :include_deleted, Boolean, "If true, deleted objects will be included. If false, deleted objects will be omitted..", null: true
          field :course_id, ID, "The id of the course to report on.Example: 2", null: true
          field :order, ReportParameterOrderEnum, "The sort order for the csv, Options: 'users', 'courses', 'outcomes'..Example: users", null: true
          field :users, Boolean, "If true, user data will be included. If false, user data will be omitted..", null: true
          field :accounts, Boolean, "If true, account data will be included. If false, account data will be omitted..", null: true
          field :terms, Boolean, "If true, term data will be included. If false, term data will be omitted..", null: true
          field :courses, Boolean, "If true, course data will be included. If false, course data will be omitted..", null: true
          field :sections, Boolean, "If true, section data will be included. If false, section data will be omitted..", null: true
          field :enrollments, Boolean, "If true, enrollment data will be included. If false, enrollment data will be omitted..", null: true
          field :groups, Boolean, "If true, group data will be included. If false, group data will be omitted..", null: true
          field :xlist, Boolean, "If true, data for crosslisted courses will be included. If false, data for crosslisted courses will be omitted..", null: true
          field :sis_terms_csv, Int, "Example: 1", null: true
          field :sis_accounts_csv, Int, "Example: 1", null: true
          field :include_enrollment_state, Boolean, "If true, enrollment state will be included. If false, enrollment state will be omitted. Defaults to false..", null: true
          field :enrollment_state, String, "Include enrollment state. Defaults to 'all' Options: ['active'| 'invited'| 'creation_pending'| 'deleted'| 'rejected'| 'completed'| 'inactive'| 'all'].Example: all", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The beginning date for submissions. Max time range is 2 weeks..Example: 2012-07-13T10:55:20-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The end date for submissions. Max time range is 2 weeks..Example: 2012-07-13T10:55:20-06:00", null: true

        end
      end
    end
  end
end