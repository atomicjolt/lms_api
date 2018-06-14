require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class SectionAssignmentOverrideAttribute < BaseType
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
          field :override_title, String, "The title for the assignment override.Example: some section override", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "the due date for the assignment. returns null if not present. NOTE: If this assignment has assignment overrides, this field will be the due date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be unlocked..Example: 2013-01-01T00:00:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be locked..Example: 2013-02-01T00:00:00-06:00", null: true

        end
      end
    end
  end
end