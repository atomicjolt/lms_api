require_relative "../canvas_base_type"
require_relative "rubric_assessment"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Rubric < BaseType
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
          field :id, Int, "the ID of the rubric.Example: 1", null: true
          field :title, String, "title of the rubric.Example: some title", null: true
          field :context_id, Int, "the context owning the rubric.Example: 1", null: true
          field :context_type, String, "Example: Course", null: true
          field :points_possible, Int, "Example: 10.0", null: true
          field :reusable, Boolean, "Example: false", null: true
          field :read_only, Boolean, "Example: true", null: true
          field :free_form_criterion_comments, Boolean, "whether or not free-form comments are used.Example: true", null: true
          field :hide_score_total, Boolean, "Example: true", null: true
          field :assessments, [LMS::GraphQL::Types::Canvas::RubricAssessment], "If an assessment type is included in the 'include' parameter, includes an array of rubric assessment objects for a given rubric, based on the assessment type requested. If the user does not request an assessment type this key will be absent..", null: true

        end
      end
    end
  end
end