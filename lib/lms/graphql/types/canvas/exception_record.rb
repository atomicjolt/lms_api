require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ExceptionRecord < BaseType
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
          field :course_id, ID, "The ID of the associated course.Example: 101", null: true
          field :conflicting_changes, String, "A list of change classes in the associated course's copy of the item that prevented a blueprint change from being applied. One or more of ['content', 'points', 'due_dates', 'availability_dates']..Example: points", null: true

        end
      end
    end
  end
end