require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateAssignmentGroup < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :name, String, required: false
          argument :position, Int, required: false
          argument :group_weight, Float, required: false
          argument :sis_source_id, String, required: false
          argument :integration_data, String, required: false
          argument :rules, String, required: false
          field :assignment_group, LMS::GraphQL::Types::Canvas::AssignmentGroup, null: false
          def resolve(course_id:, name: nil, position: nil, group_weight: nil, sis_source_id: nil, integration_data: nil, rules: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ASSIGNMENT_GROUP",
              {
                "course_id": course_id,
                "name": name,
                "position": position,
                "group_weight": group_weight,
                "sis_source_id": sis_source_id,
                "integration_data": integration_data,
                "rules": rules              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end