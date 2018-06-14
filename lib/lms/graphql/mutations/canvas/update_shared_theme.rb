require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateSharedTheme < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          field :shared_brand_config, LMS::GraphQL::Types::Canvas::SharedBrandConfig, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "UPDATE_SHARED_THEME",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end