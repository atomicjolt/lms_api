require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Assessment < BaseType
          description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
          field :id, ID, "A unique identifier for this live assessment.Example: 42", null: true
          field :key, String, "A client specified unique identifier for the assessment.Example: 2014-05-27,outcome_52", null: true
          field :title, String, "A human readable title for the assessment.Example: May 27th Reading Assessment", null: true

        end
      end
    end
  end
end