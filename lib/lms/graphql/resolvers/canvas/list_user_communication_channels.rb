require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/communication_channel"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUserCommunicationChannel < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CommunicationChannel], null: false
          argument :user_id, String, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_USER_COMMUNICATION_CHANNELS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end