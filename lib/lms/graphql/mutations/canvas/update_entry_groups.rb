require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateEntryGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          argument :id, String, required: true
          argument :message, String, required: false
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:, id:, message: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_ENTRY_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "id": id,
                "message": message              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end