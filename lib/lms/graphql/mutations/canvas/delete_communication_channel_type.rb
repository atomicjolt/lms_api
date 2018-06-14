require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteCommunicationChannelType < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :type, String, required: true
          argument :address, String, required: true
          field :communication_channel, LMS::GraphQL::Types::Canvas::CommunicationChannel, null: false
          def resolve(user_id:, type:, address:)
            ctx[:canvas_api].proxy(
              "DELETE_COMMUNICATION_CHANNEL_TYPE",
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