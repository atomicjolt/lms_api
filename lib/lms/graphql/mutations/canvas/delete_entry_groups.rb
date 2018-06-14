require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteEntryGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :id, ID, required: true
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