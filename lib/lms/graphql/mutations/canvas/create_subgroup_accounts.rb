require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSubgroupAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          argument :title, String, required: true
          argument :description, String, required: false
          argument :vendor_guid, String, required: false
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(account_id:, id:, title:, description: nil, vendor_guid: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SUBGROUP_ACCOUNTS",
              {
                "account_id": account_id,
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