require_relative "../canvas_base_type"
require_relative "grade_change_event_link"

module LMS
  module GraphQL
    module Types
      module Canvas
        class GradeChangeEvent < BaseType
          description "Grade Change Log. API Docs: https://canvas.instructure.com/doc/api/grade_change_log.html"
          field :id, String, "ID of the event..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", null: true
          field :event_type, String, "GradeChange event type.Example: grade_change", null: true
          field :excused_after, Boolean, "Boolean indicating whether the submission was excused after the change..Example: true", null: true
          field :excused_before, Boolean, "Boolean indicating whether the submission was excused before the change..", null: true
          field :grade_after, String, "The grade after the change..Example: 8", null: true
          field :grade_before, String, "The grade before the change..Example: 8", null: true
          field :graded_anonymously, Boolean, "Boolean indicating whether the student name was visible when the grade was given. Could be null if the grade change record was created before this feature existed..Example: true", null: true
          field :version_number, String, "Version Number of the grade change submission..Example: 1", null: true
          field :request_id, String, "The unique request id of the request during the grade change..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", null: true
          field :links, LMS::GraphQL::Types::Canvas::GradeChangeEventLink, "", null: true

        end
      end
    end
  end
end