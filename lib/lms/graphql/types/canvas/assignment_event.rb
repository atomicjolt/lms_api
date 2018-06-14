require_relative "../canvas_base_type"
require_relative "assignment"
require_relative "assignment_override"

module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentEventWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "published"
          value "deleted"
        end
        class AssignmentEvent < BaseType
          description "Calendar Events. API Docs: https://canvas.instructure.com/doc/api/calendar_events.html"
          field :id, ID, "A synthetic ID for the assignment.Example: assignment_987", null: true
          field :title, String, "The title of the assignment.Example: Essay", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The due_at timestamp of the assignment.Example: 2012-07-19T23:59:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The due_at timestamp of the assignment.Example: 2012-07-19T23:59:00-06:00", null: true
          field :description, String, "The HTML description of the assignment.Example: <b>Write an essay. Whatever you want.</b>", null: true
          field :context_code, String, "the context code of the (course) calendar this assignment belongs to.Example: course_123", null: true
          field :workflow_state, AssignmentEventWorkflowStateEnum, "Current state of the assignment ('published' or 'deleted').Example: published", null: true
          field :url, String, "URL for this assignment (note that updating/deleting should be done via the Assignments API).Example: https://example.com/api/v1/calendar_events/assignment_987", null: true
          field :html_url, String, "URL for a user to view this assignment.Example: http://example.com/courses/123/assignments/987", null: true
          field :all_day_date, LMS::GraphQL::Types::DateTimeType, "The due date of this assignment.Example: 2012-07-19", null: true
          field :all_day, Boolean, "Boolean indicating whether this is an all-day event (e.g. assignment due at midnight).Example: true", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When the assignment was created.Example: 2012-07-12T10:55:20-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "When the assignment was last updated.Example: 2012-07-12T10:55:20-06:00", null: true
          field :assignment, LMS::GraphQL::Types::Canvas::Assignment, "The full assignment JSON data (See the Assignments API).", null: true
          field :assignment_overrides, LMS::GraphQL::Types::Canvas::AssignmentOverride, "The list of AssignmentOverrides that apply to this event (See the Assignments API). This information is useful for determining which students or sections this assignment-due event applies to..", null: true

        end
      end
    end
  end
end