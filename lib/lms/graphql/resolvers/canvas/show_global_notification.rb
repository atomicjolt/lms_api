require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_notification"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowGlobalNotification < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::AccountNotification, null: false
          argument :account_id, String, required: true
          argument :id, String, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_GLOBAL_NOTIFICATION",
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