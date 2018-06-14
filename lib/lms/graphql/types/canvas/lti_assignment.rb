require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class LtiAssignment < BaseType
          description "Plagiarism Detection Platform Assignments. API Docs: https://canvas.instructure.com/doc/api/plagiarism_detection_platform_assignments.html"
          field :id, Int, "Example: 4", null: true
          field :name, String, "Example: Midterm Review", null: true
          field :description, String, "Example: <p>Do the following:</p>.", null: true
          field :points_possible, Int, "Example: 10", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "The due date for the assignment. If a user id is supplied and an assignment override is in place this field will reflect the due date as it applies to the user..Example: 2012-07-01T23:59:00-06:00", null: true
          field :lti_id, String, "Example: 86157096483e6b3a50bfedc6bac902c0b20a824f", null: true

        end
      end
    end
  end
end