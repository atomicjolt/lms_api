require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class NotificationPreferenceFrequencyEnum < ::GraphQL::Schema::Enum
          value "immediately"
          value "daily"
          value "weekly"
          value "never"
        end
        class NotificationPreference < BaseType
          description "Notification Preferences. API Docs: https://canvas.instructure.com/doc/api/notification_preferences.html"
          field :href, String, "Example: https://canvas.instructure.com/users/1/communication_channels/email/student@example.edu/notification_preferences/new_announcement", null: true
          field :notification, String, "The notification this preference belongs to.Example: new_announcement", null: true
          field :category, String, "The category of that notification.Example: announcement", null: true
          field :frequency, NotificationPreferenceFrequencyEnum, "How often to send notifications to this communication channel for the given notification. Possible values are 'immediately', 'daily', 'weekly', and 'never'.Example: daily", null: true

        end
      end
    end
  end
end