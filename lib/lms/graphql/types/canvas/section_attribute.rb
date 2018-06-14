require_relative "../canvas_base_type"
require_relative "course_attribute"
require_relative "course_attribute"
require_relative "section_assignment_override_attribute"

module LMS
  module GraphQL
    module Types
      module Canvas
        class SectionAttribute < BaseType
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
          field :id, ID, "The unique identifier for the section..Example: 1", null: true
          field :name, String, "The name of the section..Example: Section A", null: true
          field :sis_id, ID, "The sis id of the section..Example: s34643", null: true
          field :integration_id, ID, "Optional: The integration ID of the section..Example: 3452342345", null: true
          field :origin_course, LMS::GraphQL::Types::Canvas::CourseAttribute, "The course to which the section belongs or the course from which the section was cross-listed.", null: true
          field :xlist_course, LMS::GraphQL::Types::Canvas::CourseAttribute, "Optional: Attributes of the xlist course. Only present when the section has been cross-listed. See Courses API for more details.", null: true
          field :override, LMS::GraphQL::Types::Canvas::SectionAssignmentOverrideAttribute, "Optional: Attributes of the assignment override that apply to the section. See Assignment API for more details.", null: true

        end
      end
    end
  end
end