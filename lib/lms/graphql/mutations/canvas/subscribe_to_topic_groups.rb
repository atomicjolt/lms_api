require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SubscribeToTopicGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:)
            ctx[:canvas_api].proxy(
              "SUBSCRIBE_TO_TOPIC_GROUPS",
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