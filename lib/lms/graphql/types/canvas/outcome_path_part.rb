require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomePathPart < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
          field :name, String, "The title of the outcome or outcome group.Example: Spelling out numbers", null: true

        end
      end
    end
  end
end