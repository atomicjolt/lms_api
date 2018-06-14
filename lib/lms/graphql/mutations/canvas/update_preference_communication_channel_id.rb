require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdatePreferenceCommunicationChannelId < CanvasBaseMutation
          argument :communication_channel_id, ID, required: true
          argument :notification, String, required: true
          argument :notification_preferences_frequency, String, required: true
          field :return_value, Boolean, null: false
          def resolve(communication_channel_id:, notification:, notification_preferences_frequency:)
            ctx[:canvas_api].proxy(
              "UPDATE_PREFERENCE_COMMUNICATION_CHANNEL_ID",
              {
                "communication_channel_id": communication_channel_id,
                "notification": notification,
                "notification_preferences[frequency]": notification_preferences_frequency              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end