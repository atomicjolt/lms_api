require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAllWebhookSubscriptionForToolProxy < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_ALL_WEBHOOK_SUBSCRIPTION_FOR_TOOL_PROXY",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end