require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CreatedEventDatum < BaseType
          description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
          field :name, String, "Example: , Course 1", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "Example: , 2012-01-19T15:00:00-06:00", null: true
          field :conclude_at, LMS::GraphQL::Types::DateTimeType, "Example: , 2012-01-19T15:00:00-08:00", null: true
          field :is_public, Boolean, "Example: , false", null: true
          field :created_source, String, "The type of action that triggered the creation of the course..Example: manual|sis|api", null: true

        end
      end
    end
  end
end