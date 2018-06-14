require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class OpenPollSession < CanvasBaseResolver
          type Boolean, null: false
          argument :poll_id, String, required: true
          argument :id, String, required: true
          def resolve(poll_id:, id:)
            context[:canvas_api].proxy(
              "OPEN_POLL_SESSION",
              {
                "poll_id": poll_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end