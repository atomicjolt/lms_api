require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_notification"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class IndexOfActiveGlobalNotificationForUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::AccountNotification], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "INDEX_OF_ACTIVE_GLOBAL_NOTIFICATION_FOR_USER",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end