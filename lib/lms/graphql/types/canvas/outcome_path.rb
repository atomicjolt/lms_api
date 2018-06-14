require_relative "../canvas_base_type"
require_relative "outcome_path_part"

module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomePath < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
          field :id, Int, "A unique identifier for this outcome.Example: 42", null: true
          field :parts, LMS::GraphQL::Types::Canvas::OutcomePathPart, "an array of OutcomePathPart objects.", null: true

        end
      end
    end
  end
end