require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class PostEntryGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :topic_id, String, required: true
          argument :message, String, required: false
          argument :attachment, String, required: false
          field :return_value, Boolean, null: false
          def resolve(group_id:, topic_id:, message: nil, attachment: nil)
            ctx[:canvas_api].proxy(
              "POST_ENTRY_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "message": message,
                "attachment": attachment              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end