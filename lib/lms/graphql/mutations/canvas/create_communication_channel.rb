require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateCommunicationChannel < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :communication_channel_address, String, required: true
          argument :communication_channel_type, String, required: true
          argument :communication_channel_token, String, required: false
          argument :skip_confirmation, Boolean, required: false
          field :communication_channel, LMS::GraphQL::Types::Canvas::CommunicationChannel, null: false
          def resolve(user_id:, communication_channel_address:, communication_channel_type:, communication_channel_token: nil, skip_confirmation: nil)
            ctx[:canvas_api].proxy(
              "CREATE_COMMUNICATION_CHANNEL",
              {
                "user_id": user_id,
                "communication_channel[address]": communication_channel_address,
                "communication_channel[type]": communication_channel_type,
                "communication_channel[token]": communication_channel_token,
                "skip_confirmation": skip_confirmation              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end