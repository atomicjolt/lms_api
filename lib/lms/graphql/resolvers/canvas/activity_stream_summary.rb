require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ActivityStreamSummary < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "ACTIVITY_STREAM_SUMMARY",
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