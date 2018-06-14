require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class RubricRating < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :points, Int, "Example: 10", null: true
          field :id, ID, "Example: rat1", null: true
          field :description, String, "Example: Full marks", null: true
          field :long_description, String, "Example: Student completed the assignment flawlessly.", null: true

        end
      end
    end
  end
end