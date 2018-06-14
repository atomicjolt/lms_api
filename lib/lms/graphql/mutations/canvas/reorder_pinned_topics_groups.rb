require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReorderPinnedTopicsGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :order, Int, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, order:)
            ctx[:canvas_api].proxy(
              "REORDER_PINNED_TOPICS_GROUPS",
              {
                "group_id": group_id,
                "order": order              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end