require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class SisImportCount < BaseType
          description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
          field :accounts, Int, "Example: 0", null: true
          field :terms, Int, "Example: 3", null: true
          field :abstract_courses, Int, "Example: 0", null: true
          field :courses, Int, "Example: 121", null: true
          field :sections, Int, "Example: 278", null: true
          field :xlists, Int, "Example: 0", null: true
          field :users, Int, "Example: 346", null: true
          field :enrollments, Int, "Example: 1542", null: true
          field :groups, Int, "Example: 0", null: true
          field :group_memberships, Int, "Example: 0", null: true
          field :grade_publishing_results, Int, "Example: 0", null: true
          field :batch_courses_deleted, Int, "the number of courses that were removed because they were not included in the batch for batch_mode imports. Only included if courses were deleted.Example: 11", null: true
          field :batch_sections_deleted, Int, "the number of sections that were removed because they were not included in the batch for batch_mode imports. Only included if sections were deleted.Example: 0", null: true
          field :batch_enrollments_deleted, Int, "the number of enrollments that were removed because they were not included in the batch for batch_mode imports. Only included if enrollments were deleted.Example: 150", null: true
          field :error_count, Int, "Example: 0", null: true
          field :warning_count, Int, "Example: 0", null: true

        end
      end
    end
  end
end