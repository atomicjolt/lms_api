require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListClosedPollSession < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_CLOSED_POLL_SESSIONS",
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