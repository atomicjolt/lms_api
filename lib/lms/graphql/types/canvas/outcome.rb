require_relative "../canvas_base_type"
require_relative "rubric_rating"

module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeCalculationMethodEnum < ::GraphQL::Schema::Enum
          value "decaying_average"
          value "n_mastery"
          value "latest"
          value "highest"
        end
        class Outcome < BaseType
          description "Outcomes. API Docs: https://canvas.instructure.com/doc/api/outcomes.html"
          field :id, ID, "the ID of the outcome.Example: 1", null: true
          field :url, String, "the URL for fetching/updating the outcome. should be treated as opaque.Example: /api/v1/outcomes/1", null: true
          field :context_id, ID, "the context owning the outcome. may be null for global outcomes.Example: 1", null: true
          field :context_type, String, "Example: Account", null: true
          field :title, String, "title of the outcome.Example: Outcome title", null: true
          field :display_name, String, "Optional friendly name for reporting.Example: My Favorite Outcome", null: true
          field :description, String, "description of the outcome. omitted in the abbreviated form..Example: Outcome description", null: true
          field :vendor_guid, String, "A custom GUID for the learning standard..Example: customid9000", null: true
          field :points_possible, Int, "maximum points possible. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..Example: 5", null: true
          field :mastery_points, Int, "points necessary to demonstrate mastery outcomes. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..Example: 3", null: true
          field :calculation_method, OutcomeCalculationMethodEnum, "the method used to calculate a students score.Example: decaying_average", null: true
          field :calculation_int, Int, "this defines the variable value used by the calculation_method. included only if calculation_method uses it.Example: 75", null: true
          field :ratings, [LMS::GraphQL::Types::Canvas::RubricRating], "possible ratings for this outcome. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..", null: true
          field :can_edit, Boolean, "whether the current user can update the outcome.Example: true", null: true
          field :can_unlink, Boolean, "whether the outcome can be unlinked.Example: true", null: true
          field :assessed, Boolean, "whether this outcome has been used to assess a student.Example: true", null: true
          field :has_updateable_rubrics, Boolean, "whether updates to this outcome will propagate to unassessed rubrics that have imported it.Example: true", null: true

        end
      end
    end
  end
end