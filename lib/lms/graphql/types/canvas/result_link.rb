require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ResultLink < BaseType
          description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
          field :user, String, "A unique identifier for the user to whom this result applies.Example: 42", null: true
          field :assessor, String, "A unique identifier for the user who created this result.Example: 23", null: true
          field :assessment, String, "A unique identifier for the assessment that this result is for.Example: 5", null: true

        end
      end
    end
  end
end