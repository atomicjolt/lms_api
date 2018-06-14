require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateMultiplePreferencesType < CanvasBaseMutation
          argument :type, String, required: true
          argument :address, String, required: true
          argument :notification_preferences__x__frequency, String, required: true
          field :return_value, Boolean, null: false
          def resolve(type:, address:, notification_preferences__x__frequency:)
            ctx[:canvas_api].proxy(
              "UPDATE_MULTIPLE_PREFERENCES_TYPE",
              {
                "type": type,
                "address": address,
                "notification_preferences[<X>][frequency]": notification_preferences__x__frequency              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end