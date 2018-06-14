require_relative "../canvas_base_type"
require_relative "course_event_link"

module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseEvent < BaseType
          description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
          field :id, String, "ID of the event..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", null: true
          field :event_type, String, "Course event type The event type defines the type and schema of the event_data object..Example: updated", null: true
          field :event_data, String, "Course event data depending on the event type.  This will return an object containing the relevant event data.  An updated event type will return an UpdatedEventData object..Example: {}", null: true
          field :event_source, String, "Course event source depending on the event type.  This will return a string containing the source of the event..Example: manual|sis|api", null: true
          field :links, LMS::GraphQL::Types::Canvas::CourseEventLink, "Jsonapi.org links.Example: 12345, 12345, e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true

        end
      end
    end
  end
end