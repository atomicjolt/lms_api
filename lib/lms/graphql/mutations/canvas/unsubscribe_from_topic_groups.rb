require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UnsubscribeFromTopicGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :topic_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:)
            ctx[:canvas_api].proxy(
              "UNSUBSCRIBE_FROM_TOPIC_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end