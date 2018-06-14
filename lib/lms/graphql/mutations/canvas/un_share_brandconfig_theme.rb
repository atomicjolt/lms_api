require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UnShareBrandconfigTheme < CanvasBaseMutation
          argument :id, ID, required: true
          field :shared_brand_config, LMS::GraphQL::Types::Canvas::SharedBrandConfig, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "UN_SHARE_BRANDCONFIG_THEME",
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