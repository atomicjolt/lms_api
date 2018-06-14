require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSinglePollSubmission < CanvasBaseResolver
          type Boolean, null: false
          argument :poll_id, ID, required: true
          argument :poll_session_id, ID, required: true
          argument :id, ID, required: true
          def resolve(poll_id:, poll_session_id:, id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_POLL_SUBMISSION",
              {
                "poll_id": poll_id,
                "poll_session_id": poll_session_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end