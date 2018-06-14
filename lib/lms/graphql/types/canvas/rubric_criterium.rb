require_relative "../canvas_base_type"
require_relative "rubric_rating"

module LMS
  module GraphQL
    module Types
      module Canvas
        class RubricCriterium < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :points, Int, "Example: 10", null: true
          field :id, ID, "The id of rubric criteria..Example: crit1", null: true
          field :learning_outcome_id, ID, "(Optional) The id of the learning outcome this criteria uses, if any..Example: 1234", null: true
          field :vendor_guid, String, "(Optional) The 3rd party vendor's GUID for the outcome this criteria references, if any..Example: abdsfjasdfne3jsdfn2", null: true
          field :description, String, "Example: Criterion 1", null: true
          field :long_description, String, "Example: Criterion 1 more details", null: true
          field :criterion_use_range, Boolean, "Example: true", null: true
          field :ratings, [LMS::GraphQL::Types::Canvas::RubricRating], "", null: true

        end
      end
    end
  end
end