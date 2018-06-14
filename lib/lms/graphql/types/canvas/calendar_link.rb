require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CalendarLink < BaseType
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
          field :ics, String, "The URL of the calendar in ICS format.Example: https://canvas.instructure.com/feeds/calendars/course_abcdef.ics", null: true

        end
      end
    end
  end
end