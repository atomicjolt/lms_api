require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListTopicEntriesGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :group_id, ID, required: true
          argument :topic_id, ID, required: true
          def resolve(group_id:, topic_id:)
            context[:canvas_api].proxy(
              "LIST_TOPIC_ENTRIES_GROUPS",
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