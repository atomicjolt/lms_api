require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSubgroupGlobal < CanvasBaseMutation
          argument :id, ID, required: true
          argument :title, String, required: true
          argument :description, String, required: false
          argument :vendor_guid, String, required: false
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(id:, title:, description: nil, vendor_guid: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SUBGROUP_GLOBAL",
              {
                "id": id,
                "title": title,
                "description": description,
                "vendor_guid": vendor_guid              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end