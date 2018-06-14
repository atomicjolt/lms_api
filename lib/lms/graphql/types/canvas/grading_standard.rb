require_relative "../canvas_base_type"
require_relative "grading_scheme_entry"

module LMS
  module GraphQL
    module Types
      module Canvas
        class GradingStandard < BaseType
          description "Grading Standards. API Docs: https://canvas.instructure.com/doc/api/grading_standards.html"
          field :title, String, "the title of the grading standard.Example: Account Standard", null: true
          field :id, ID, "the id of the grading standard.Example: 1", null: true
          field :context_type, String, "the context this standard is associated with, either 'Account' or 'Course'.Example: Account", null: true
          field :context_id, ID, "the id for the context either the Account or Course id.Example: 1", null: true
          field :grading_scheme, [LMS::GraphQL::Types::Canvas::GradingSchemeEntry], "A list of GradingSchemeEntry that make up the Grading Standard as an array of values with the scheme name and value.Example: {'name'=>'A', 'value'=>0.9}, {'name'=>'B', 'value'=>0.8}, {'name'=>'C', 'value'=>0.7}, {'name'=>'D', 'value'=>0.6}", null: true

        end
      end
    end
  end
end