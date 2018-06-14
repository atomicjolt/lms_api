require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetBrandConfigVariablesThatShouldBeUsedForThisDomain < CanvasBaseResolver
          type Boolean, null: false

          def resolve()
            context[:canvas_api].proxy(
              "GET_BRAND_CONFIG_VARIABLES_THAT_SHOULD_BE_USED_FOR_THIS_DOMAIN",
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