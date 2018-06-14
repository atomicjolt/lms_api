require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ChangeRecord < BaseType
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
          field :asset_id, Int, "The ID of the learning object that was changed in the blueprint course..Example: 2", null: true
          field :asset_type, String, "The type of the learning object that was changed in the blueprint course.  One of 'assignment', 'attachment', 'discussion_topic', 'external_tool', 'quiz', or 'wiki_page'..Example: assignment", null: true
          field :asset_name, String, "The name of the learning object that was changed in the blueprint course..Example: Some Assignment", null: true
          field :change_type, String, "The type of change; one of 'created', 'updated', 'deleted'.Example: created", null: true
          field :html_url, String, "The URL of the changed object.Example: https://canvas.example.com/courses/101/assignments/2", null: true
          field :locked, Boolean, "Whether the object is locked in the blueprint.", null: true
          field :exceptions, String, "A list of ExceptionRecords for linked courses that did not receive this update..Example: {'course_id'=>101, 'conflicting_changes'=>['points']}", null: true

        end
      end
    end
  end
end