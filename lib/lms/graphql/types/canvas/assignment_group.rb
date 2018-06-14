require_relative "../canvas_base_type"
require_relative "grading_rule"

module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentGroup < BaseType
          description "Assignment Groups. API Docs: https://canvas.instructure.com/doc/api/assignment_groups.html"
          field :id, ID, "the id of the Assignment Group.Example: 1", null: true
          field :name, String, "the name of the Assignment Group.Example: group2", null: true
          field :position, Int, "the position of the Assignment Group.Example: 7", null: true
          field :group_weight, Int, "the weight of the Assignment Group.Example: 20", null: true
          field :sis_source_id, ID, "the sis source id of the Assignment Group.Example: 1234", null: true
          field :integration_data, String, "the integration data of the Assignment Group.Example: 0954", null: true
          field :assignments, Int, "the assignments in this Assignment Group (see the Assignment API for a detailed list of fields).", null: true
          field :rules, LMS::GraphQL::Types::Canvas::GradingRule, "the grading rules that this Assignment Group has.", null: true

        end
      end
    end
  end
end