require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateOutcomeGroupCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :title, String, required: false
          argument :description, String, required: false
          argument :vendor_guid, String, required: false
          argument :parent_outcome_group_id, Int, required: false
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(course_id:, id:, title: nil, description: nil, vendor_guid: nil, parent_outcome_group_id: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_OUTCOME_GROUP_COURSES",
              {
                "course_id": course_id,
                "id": id,
                "title": title,
                "description": description,
                "vendor_guid": vendor_guid,
                "parent_outcome_group_id": parent_outcome_group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end