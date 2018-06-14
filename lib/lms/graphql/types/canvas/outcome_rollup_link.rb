require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeRollupLink < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
          field :course, Int, "If an aggregate result was requested, the course field will be present. Otherwise, the user and section field will be present (Optional) The id of the course that this rollup applies to.Example: 42", null: true
          field :user, Int, "(Optional) The id of the user that this rollup applies to.Example: 42", null: true
          field :section, Int, "(Optional) The id of the section the user is in.Example: 57", null: true

        end
      end
    end
  end
end