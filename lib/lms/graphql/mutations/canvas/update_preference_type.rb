require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdatePreferenceType < CanvasBaseMutation
          argument :type, String, required: true
          argument :address, String, required: true
          argument :notification, String, required: true
          argument :notification_preferences_frequency, String, required: true
          field :return_value, Boolean, null: false
          def resolve(type:, address:, notification:, notification_preferences_frequency:)
            ctx[:canvas_api].proxy(
              "UPDATE_PREFERENCE_TYPE",
              {
                "type": type,
                "address": address,
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