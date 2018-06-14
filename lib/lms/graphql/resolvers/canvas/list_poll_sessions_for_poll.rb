require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPollSessionsForPoll < CanvasBaseResolver
          type Boolean, null: false
          argument :poll_id, ID, required: true
          def resolve(poll_id:)
            context[:canvas_api].proxy(
              "LIST_POLL_SESSIONS_FOR_POLL",
              {
                "poll_id": poll_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end