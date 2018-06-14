require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeRollupScoreLink < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
          field :outcome, Int, "The id of the related outcome.Example: 42", null: true

        end
      end
    end
  end
end