require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account_notification"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CloseNotificationForUser < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          field :account_notification, LMS::GraphQL::Types::Canvas::AccountNotification, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "CLOSE_NOTIFICATION_FOR_USER",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end