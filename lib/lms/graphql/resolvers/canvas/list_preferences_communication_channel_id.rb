require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPreferencesCommunicationChannelId < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::NotificationPreference], null: false
          argument :user_id, String, required: true
          argument :communication_channel_id, String, required: true
          def resolve(user_id:, communication_channel_id:)
            context[:canvas_api].proxy(
              "LIST_PREFERENCES_COMMUNICATION_CHANNEL_ID",
              {
                "user_id": user_id,
                "communication_channel_id": communication_channel_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end