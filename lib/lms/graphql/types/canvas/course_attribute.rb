require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CourseAttribute < BaseType
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
          field :id, ID, "The unique Canvas identifier for the origin course.Example: 7", null: true
          field :name, String, "The name of the origin course..Example: Section A", null: true
          field :sis_id, ID, "The sis id of the origin_course..Example: c34643", null: true
          field :integration_id, ID, "The integration ID of the origin_course..Example: I-2", null: true

        end
      end
    end
  end
end