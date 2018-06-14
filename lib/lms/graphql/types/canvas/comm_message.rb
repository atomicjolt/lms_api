require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CommMessageWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "staged"
          value "sending"
          value "sent"
          value "bounced"
          value "dashboard"
          value "cancelled"
          value "closed"
        end
        class CommMessage < BaseType
          description "CommMessages. API Docs: https://canvas.instructure.com/doc/api/comm_messages.html"
          field :id, Int, "The ID of the CommMessage..Example: 42", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "The date and time this message was created.Example: 2013-03-19T21:00:00Z", null: true
          field :sent_at, LMS::GraphQL::Types::DateTimeType, "The date and time this message was sent.Example: 2013-03-20T22:42:00Z", null: true
          field :workflow_state, CommMessageWorkflowStateEnum, "The workflow state of the message. One of 'created', 'staged', 'sending', 'sent', 'bounced', 'dashboard', 'cancelled', or 'closed'.Example: sent", null: true
          field :from, String, "The address that was put in the 'from' field of the message.Example: notifications@example.com", null: true
          field :from_name, String, "The display name for the from address.Example: Instructure Canvas", null: true
          field :to, String, "The address the message was sent to:.Example: someone@example.com", null: true
          field :reply_to, String, "The reply_to header of the message.Example: notifications+specialdata@example.com", null: true
          field :subject, String, "The message subject.Example: example subject line", null: true
          field :body, String, "The plain text body of the message.Example: This is the body of the message", null: true
          field :html_body, String, "The HTML body of the message..Example: <html><body>This is the body of the message</body></html>", null: true

        end
      end
    end
  end
end