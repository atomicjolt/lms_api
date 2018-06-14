require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class AccountNotificationIconEnum < ::GraphQL::Schema::Enum
          value "warning"
          value "information"
          value "question"
          value "error"
          value "calendar"
        end
        class AccountNotification < BaseType
          description "Account Notifications. API Docs: https://canvas.instructure.com/doc/api/account_notifications.html"
          field :subject, String, "The subject of the notifications.Example: Attention Students", null: true
          field :message, String, "The message to be sent in the notification..Example: This is a test of the notification system.", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "When to send out the notification..Example: 2013-08-28T23:59:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "When to expire the notification..Example: 2013-08-29T23:59:00-06:00", null: true
          field :icon, AccountNotificationIconEnum, "The icon to display with the message.  Defaults to warning..Example: information", null: true
          field :roles, String, "(Deprecated) The roles to send the notification to.  If roles is not passed it defaults to all roles.Example: StudentEnrollment", null: true
          field :role_ids, [ID], "The roles to send the notification to.  If roles is not passed it defaults to all roles.Example: 1", null: true

        end
      end
    end
  end
end