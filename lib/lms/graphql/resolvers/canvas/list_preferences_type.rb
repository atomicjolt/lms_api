require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPreferencesType < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::NotificationPreference], null: false
          argument :user_id, ID, required: true
          argument :type, String, required: true
          argument :address, String, required: true
          def resolve(user_id:, type:, address:)
            context[:canvas_api].proxy(
              "LIST_PREFERENCES_TYPE",
              {
                "user_id": user_id,
                "type": type,
                "address": address              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end