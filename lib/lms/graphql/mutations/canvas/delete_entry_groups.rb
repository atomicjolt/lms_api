require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteEntryGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          argument :id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_ENTRY_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end