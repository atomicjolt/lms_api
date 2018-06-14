require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sso_setting"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowAccountAuthSetting < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::SSOSetting, null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "SHOW_ACCOUNT_AUTH_SETTINGS",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end