require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentGroupAttribute < BaseType
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
          field :id, Int, "the id of the Assignment Group.Example: 1", null: true
          field :name, String, "the name of the Assignment Group.Example: group2", null: true
          field :group_weight, Int, "the weight of the Assignment Group.Example: 20", null: true
          field :sis_source_id, String, "the sis source id of the Assignment Group.Example: 1234", null: true
          field :integration_data, String, "the integration data of the Assignment Group.Example: 0954", null: true

        end
      end
    end
  end
end