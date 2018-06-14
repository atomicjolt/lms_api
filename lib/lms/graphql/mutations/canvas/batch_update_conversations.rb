require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class BatchUpdateConversation < CanvasBaseMutation
          argument :conversation_ids, [ID], required: true
          argument :event, String, required: true
          field :progress, LMS::GraphQL::Types::Canvas::Progress, null: false
          def resolve(conversation_ids:, event:)
            ctx[:canvas_api].proxy(
              "BATCH_UPDATE_CONVERSATIONS",
              {
                "conversation_ids": conversation_ids,
                "event": event              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end