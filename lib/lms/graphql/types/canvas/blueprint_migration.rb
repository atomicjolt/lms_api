require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class BlueprintMigration < BaseType
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
          field :id, Int, "The ID of the migration..Example: 1", null: true
          field :template_id, Int, "The ID of the template the migration belongs to. Only present when querying a blueprint course..Example: 2", null: true
          field :subscription_id, Int, "The ID of the associated course's blueprint subscription. Only present when querying a course associated with a blueprint..Example: 101", null: true
          field :user_id, Int, "The ID of the user who queued the migration..Example: 3", null: true
          field :workflow_state, String, "Current state of the content migration: queued, exporting, imports_queued, completed, exports_failed, imports_failed.Example: running", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "Time when the migration was queued.Example: 2013-08-28T23:59:00-06:00", null: true
          field :exports_started_at, LMS::GraphQL::Types::DateTimeType, "Time when the exports begun.Example: 2013-08-28T23:59:00-06:00", null: true
          field :imports_queued_at, LMS::GraphQL::Types::DateTimeType, "Time when the exports were completed and imports were queued.Example: 2013-08-28T23:59:00-06:00", null: true
          field :imports_completed_at, LMS::GraphQL::Types::DateTimeType, "Time when the imports were completed.Example: 2013-08-28T23:59:00-06:00", null: true
          field :comment, String, "User-specified comment describing changes made in this operation.Example: Fixed spelling in question 3 of midterm exam", null: true

        end
      end
    end
  end
end