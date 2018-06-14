require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateConversation < CanvasBaseMutation
          argument :recipients, String, required: true
          argument :subject, String, required: false
          argument :body, String, required: true
          argument :group_conversation, Boolean, required: false
          argument :attachment_ids, String, required: false
          argument :media_comment_id, String, required: false
          argument :media_comment_type, String, required: false
          argument :user_note, Boolean, required: false
          argument :mode, String, required: false
          argument :scope, String, required: false
          argument :filter, String, required: false
          argument :filter_mode, String, required: false
          argument :context_code, String, required: false
          field :return_value, Boolean, null: false
          def resolve(recipients:, subject: nil, body:, group_conversation: nil, attachment_ids: nil, media_comment_id: nil, media_comment_type: nil, user_note: nil, mode: nil, scope: nil, filter: nil, filter_mode: nil, context_code: nil)
            ctx[:canvas_api].proxy(
              "CREATE_CONVERSATION",
              {
                "recipients": recipients,
                "subject": subject,
                "body": body,
                "group_conversation": group_conversation,
                "attachment_ids": attachment_ids,
                "media_comment_id": media_comment_id,
                "media_comment_type": media_comment_type,
                "user_note": user_note,
                "mode": mode,
                "scope": scope,
                "filter": filter,
                "filter_mode": filter_mode,
                "context_code": context_code              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end