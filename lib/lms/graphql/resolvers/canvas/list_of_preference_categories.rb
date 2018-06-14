require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListOfPreferenceCategory < CanvasBaseResolver
          type Boolean, null: false
          argument :user_id, String, required: true
          argument :communication_channel_id, String, required: true
          def resolve(user_id:, communication_channel_id:)
            context[:canvas_api].proxy(
              "LIST_OF_PREFERENCE_CATEGORIES",
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