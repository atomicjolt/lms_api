require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentOverride < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :id, Int, "the ID of the assignment override.Example: 4", null: true
          field :assignment_id, Int, "the ID of the assignment the override applies to.Example: 123", null: true
          field :student_ids, Int, "the IDs of the override's target students (present if the override targets an ad-hoc set of students).Example: 1, 2, 3", null: true
          field :group_id, Int, "the ID of the override's target group (present if the override targets a group and the assignment is a group assignment).Example: 2", null: true
          field :course_section_id, Int, "the ID of the overrides's target section (present if the override targets a section).Example: 1", null: true
          field :title, String, "the title of the override.Example: an assignment override", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "the overridden due at (present if due_at is overridden).Example: 2012-07-01T23:59:00-06:00", null: true
          field :all_day, Int, "the overridden all day flag (present if due_at is overridden).Example: true", null: true
          field :all_day_date, LMS::GraphQL::Types::DateTimeType, "the overridden all day date (present if due_at is overridden).Example: 2012-07-01", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "the overridden unlock at (present if unlock_at is overridden).Example: 2012-07-01T23:59:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "the overridden lock at, if any (present if lock_at is overridden).Example: 2012-07-01T23:59:00-06:00", null: true

        end
      end
    end
  end
end