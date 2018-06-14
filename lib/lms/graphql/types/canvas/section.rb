require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Section < BaseType
          description "Sections. API Docs: https://canvas.instructure.com/doc/api/sections.html"
          field :id, Int, "The unique identifier for the section..Example: 1", null: true
          field :name, String, "The name of the section..Example: Section A", null: true
          field :sis_section_id, String, "The sis id of the section. This field is only included if the user has permission to view SIS information..Example: s34643", null: true
          field :integration_id, String, "Optional: The integration ID of the section. This field is only included if the user has permission to view SIS information..Example: 3452342345", null: true
          field :sis_import_id, Int, "The unique identifier for the SIS import if created through SIS. This field is only included if the user has permission to manage SIS information..Example: 47", null: true
          field :course_id, Int, "The unique Canvas identifier for the course in which the section belongs.Example: 7", null: true
          field :sis_course_id, String, "The unique SIS identifier for the course in which the section belongs. This field is only included if the user has permission to view SIS information..Example: 7", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "the start date for the section, if applicable.Example: 2012-06-01T00:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "the end date for the section, if applicable.", null: true
          field :restrict_enrollments_to_section_dates, Boolean, "Restrict user enrollments to the start and end dates of the section.", null: true
          field :nonxlist_course_id, Int, "The unique identifier of the original course of a cross-listed section.", null: true
          field :total_students, Int, "optional: the total number of active and invited students in the section.Example: 13", null: true

        end
      end
    end
  end
end