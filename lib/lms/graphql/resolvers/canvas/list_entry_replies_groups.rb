require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEntryRepliesGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          argument :entry_id, String, required: true
          def resolve(group_id:, topic_id:, entry_id:)
            context[:canvas_api].proxy(
              "LIST_ENTRY_REPLIES_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "entry_id": entry_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end