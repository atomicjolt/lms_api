require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetRunningBatch < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "GET_RUNNING_BATCHES",
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