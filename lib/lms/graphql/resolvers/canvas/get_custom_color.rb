require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCustomColor < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          argument :asset_string, String, required: true
          def resolve(id:, asset_string:)
            context[:canvas_api].proxy(
              "GET_CUSTOM_COLOR",
              {
                "id": id,
                "asset_string": asset_string              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end