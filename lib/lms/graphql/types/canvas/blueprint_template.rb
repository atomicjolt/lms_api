require_relative "../canvas_base_type"
require_relative "blueprint_migration"

module LMS
  module GraphQL
    module Types
      module Canvas
        class BlueprintTemplate < BaseType
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
          field :id, ID, "The ID of the template..Example: 1", null: true
          field :course_id, ID, "The ID of the Course the template belongs to..Example: 2", null: true
          field :last_export_completed_at, LMS::GraphQL::Types::DateTimeType, "Time when the last export was completed.Example: 2013-08-28T23:59:00-06:00", null: true
          field :associated_course_count, Int, "Number of associated courses for the template.Example: 3", null: true
          field :latest_migration, String, "Details of the latest migration.", null: true

        end
      end
    end
  end
end