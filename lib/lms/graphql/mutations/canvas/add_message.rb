require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddMessage < CanvasBaseMutation
          argument :id, ID, required: true
          argument :body, String, required: true
          argument :attachment_ids, [ID], required: false
          argument :media_comment_id, ID, required: false
          argument :media_comment_type, String, required: false
          argument :recipients, String, required: false
          argument :included_messages, String, required: false
          argument :user_note, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, body:, attachment_ids: nil, media_comment_id: nil, media_comment_type: nil, recipients: nil, included_messages: nil, user_note: nil)
            ctx[:canvas_api].proxy(
              "ADD_MESSAGE",
              {
                "id": id,
                "body": body,
                "attachment_ids": attachment_ids,
                "media_comment_id": media_comment_id,
                "media_comment_type": media_comment_type,
                "recipients": recipients,
                "included_messages": included_messages,
                "user_note": user_note              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end