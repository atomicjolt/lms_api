require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PlannerNote < BaseType
          description "Planner Note. API Docs: https://canvas.instructure.com/doc/api/planner_note.html"
          field :id, Int, "The ID of the planner note.Example: 234", null: true
          field :title, String, "The title for a planner note.Example: Bring books tomorrow", null: true
          field :description, String, "The description of the planner note.Example: I need to bring books tomorrow for my course on biology", null: true
          field :user_id, Int, "The id of the associated user creating the planner note.Example: 1578941", null: true
          field :workflow_state, String, "The current published state of the planner note.Example: active", null: true
          field :course_id, Int, "The course that the note is in relation too, if applicable.Example: 1578941", null: true
          field :todo_date, LMS::GraphQL::Types::DateTimeType, "The datetime of when the planner note should show up on their planner.Example: 2017-05-09T10:12:00Z", null: true
          field :linked_object_type, String, "the type of the linked learning object.Example: assignment", null: true
          field :linked_object_id, Int, "the id of the linked learning object.Example: 131072", null: true
          field :linked_object_html_url, String, "the Canvas web URL of the linked learning object.Example: https://canvas.example.com/courses/1578941/assignments/131072", null: true
          field :linked_object_url, String, "the API URL of the linked learning object.Example: https://canvas.example.com/api/v1/courses/1578941/assignments/131072", null: true

        end
      end
    end
  end
end