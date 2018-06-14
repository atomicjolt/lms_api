require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetKalturaConfig < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "GET_KALTURA_CONFIG",
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