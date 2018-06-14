require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RateEntryGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          argument :entry_id, String, required: true
          argument :rating, Int, required: false
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:, entry_id:, rating: nil)
            ctx[:canvas_api].proxy(
              "RATE_ENTRY_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "entry_id": entry_id,
                "rating": rating              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end