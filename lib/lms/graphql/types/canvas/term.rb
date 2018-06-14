require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Term < BaseType
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
          field :id, ID, "Example: 1", null: true
          field :name, String, "Example: Default Term", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-06-01T00:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "", null: true

        end
      end
    end
  end
end