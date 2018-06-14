require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdatePreferencesByCategory < CanvasBaseMutation
          argument :communication_channel_id, String, required: true
          argument :category, String, required: true
          argument :notification_preferences_frequency, String, required: true
          field :return_value, Boolean, null: false
          def resolve(communication_channel_id:, category:, notification_preferences_frequency:)
            ctx[:canvas_api].proxy(
              "UPDATE_PREFERENCES_BY_CATEGORY",
              {
                "communication_channel_id": communication_channel_id,
                "category": category,
                "notification_preferences[frequency]": notification_preferences_frequency              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end