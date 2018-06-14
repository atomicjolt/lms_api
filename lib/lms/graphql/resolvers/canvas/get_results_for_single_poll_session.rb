require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetResultsForSinglePollSession < CanvasBaseResolver
          type Boolean, null: false
          argument :poll_id, String, required: true
          argument :id, String, required: true
          def resolve(poll_id:, id:)
            context[:canvas_api].proxy(
              "GET_RESULTS_FOR_SINGLE_POLL_SESSION",
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