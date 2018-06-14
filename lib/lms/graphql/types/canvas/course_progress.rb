require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseProgress < BaseType
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
          field :requirement_count, Int, "total number of requirements from all modules.Example: 10", null: true
          field :requirement_completed_count, Int, "total number of requirements the user has completed from all modules.Example: 1", null: true
          field :next_requirement_url, String, "url to next module item that has an unmet requirement. null if the user has completed the course or the current module does not require sequential progress.Example: http://localhost/courses/1/modules/items/2", null: true
          field :completed_at, LMS::GraphQL::Types::DateTimeType, "date the course was completed. null if the course has not been completed by this user.Example: 2013-06-01T00:00:00-06:00", null: true

        end
      end
    end
  end
end