require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeResult < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
          field :id, ID, "A unique identifier for this result.Example: 42", null: true
          field :score, Int, "The student's score.Example: 6", null: true
          field :submitted_or_assessed_at, LMS::GraphQL::Types::DateTimeType, "The datetime the resulting OutcomeResult was submitted at, or absent that, when it was assessed..Example: 2013-02-01T00:00:00-06:00", null: true
          field :links, String, "Unique identifiers of objects associated with this result.Example: 3, 97, 53", null: true
          field :percent, Float, "score's percent of maximum points possible for outcome, scaled to reflect any custom mastery levels that differ from the learning outcome.Example: 0.65", null: true

        end
      end
    end
  end
end