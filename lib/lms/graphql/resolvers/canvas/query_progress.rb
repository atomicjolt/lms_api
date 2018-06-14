require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/progress"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class QueryProgress < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Progress, null: false
          argument :id, ID, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "QUERY_PROGRESS",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end