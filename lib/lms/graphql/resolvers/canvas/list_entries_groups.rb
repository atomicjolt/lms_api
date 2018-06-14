require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEntriesGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :group_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :ids, String, required: false
          def resolve(group_id:, topic_id:, ids: nil)
            context[:canvas_api].proxy(
              "LIST_ENTRIES_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "ids": ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end