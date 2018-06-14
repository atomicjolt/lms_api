require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/sso_setting"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateAccountAuthSetting < CanvasBaseMutation
          argument :account_id, ID, required: true
          field :sso_setting, LMS::GraphQL::Types::Canvas::SSOSetting, null: false
          def resolve(account_id:)
            ctx[:canvas_api].proxy(
              "UPDATE_ACCOUNT_AUTH_SETTINGS",
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