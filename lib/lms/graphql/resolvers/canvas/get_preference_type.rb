require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetPreferenceType < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::NotificationPreference, null: false
          argument :user_id, ID, required: true
          argument :type, String, required: true
          argument :address, String, required: true
          argument :notification, String, required: true
          def resolve(user_id:, type:, address:, notification:)
            context[:canvas_api].proxy(
              "GET_PREFERENCE_TYPE",
              {
                "user_id": user_id,
                "type": type,
                "address": address,
                "notification": notification              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end