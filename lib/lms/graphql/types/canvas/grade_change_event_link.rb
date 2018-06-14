require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class GradeChangeEventLink < BaseType
          description "Grade Change Log. API Docs: https://canvas.instructure.com/doc/api/grade_change_log.html"
          field :assignment, Int, "ID of the assignment associated with the event.Example: 2319", null: true
          field :course, Int, "ID of the course associated with the event. will match the context_id in the associated assignment if the context type for the assignment is a course.Example: 2319", null: true
          field :student, Int, "ID of the student associated with the event. will match the user_id in the associated submission..Example: 2319", null: true
          field :grader, Int, "ID of the grader associated with the event. will match the grader_id in the associated submission..Example: 2319", null: true
          field :page_view, String, "ID of the page view during the event if it exists..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true

        end
      end
    end
  end
end