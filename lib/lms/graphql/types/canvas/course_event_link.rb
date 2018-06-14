require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseEventLink < BaseType
          description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
          field :course, Int, "ID of the course for the event..Example: 12345", null: true
          field :user, Int, "ID of the user for the event (who made the change)..Example: 12345", null: true
          field :page_view, String, "ID of the page view during the event if it exists..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true
          field :copied_from, Int, "ID of the course that this course was copied from. This is only included if the event_type is copied_from..Example: 12345", null: true
          field :copied_to, Int, "ID of the course that this course was copied to. This is only included if the event_type is copied_to..Example: 12345", null: true
          field :sis_batch, Int, "ID of the SIS batch that triggered the event..Example: 12345", null: true

        end
      end
    end
  end
end