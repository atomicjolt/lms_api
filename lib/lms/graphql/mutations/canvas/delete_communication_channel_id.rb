require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteCommunicationChannelId < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :id, String, required: true
          field :communication_channel, LMS::GraphQL::Types::Canvas::CommunicationChannel, null: false
          def resolve(user_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_COMMUNICATION_CHANNEL_ID",
              {
                "user_id": user_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end