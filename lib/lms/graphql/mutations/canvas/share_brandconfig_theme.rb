require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/shared_brand_config"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ShareBrandconfigTheme < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :shared_brand_config_name, String, required: true
          argument :shared_brand_config_brand_config_md5, String, required: true
          field :shared_brand_config, LMS::GraphQL::Types::Canvas::SharedBrandConfig, null: false
          def resolve(account_id:, shared_brand_config_name:, shared_brand_config_brand_config_md5:)
            ctx[:canvas_api].proxy(
              "SHARE_BRANDCONFIG_THEME",
              {
                "account_id": account_id,
                "shared_brand_config[name]": shared_brand_config_name,
                "shared_brand_config[brand_config_md5]": shared_brand_config_brand_config_md5              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end