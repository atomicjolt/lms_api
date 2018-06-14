require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateGlobalNotification < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :account_notification_subject, String, required: true
          argument :account_notification_message, String, required: true
          argument :account_notification_start_at, LMS::GraphQL::Types::DateTimeType, required: true
          argument :account_notification_end_at, LMS::GraphQL::Types::DateTimeType, required: true
          argument :account_notification_icon, String, required: false
          argument :account_notification_roles, String, required: false
          field :return_value, Boolean, null: false
          def resolve(account_id:, account_notification_subject:, account_notification_message:, account_notification_start_at:, account_notification_end_at:, account_notification_icon: nil, account_notification_roles: nil)
            ctx[:canvas_api].proxy(
              "CREATE_GLOBAL_NOTIFICATION",
              {
                "account_id": account_id,
                "account_notification[subject]": account_notification_subject,
                "account_notification[message]": account_notification_message,
                "account_notification[start_at]": account_notification_start_at,
                "account_notification[end_at]": account_notification_end_at,
                "account_notification[icon]": account_notification_icon,
                "account_notification_roles": account_notification_roles              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end