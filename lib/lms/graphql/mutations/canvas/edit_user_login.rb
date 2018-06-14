require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EditUserLogin < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          argument :login_unique_id, String, required: false
          argument :login_password, String, required: false
          argument :login_sis_user_id, String, required: false
          argument :login_integration_id, String, required: false
          field :return_value, Boolean, null: false
          def resolve(account_id:, id:, login_unique_id: nil, login_password: nil, login_sis_user_id: nil, login_integration_id: nil)
            ctx[:canvas_api].proxy(
              "EDIT_USER_LOGIN",
              {
                "account_id": account_id,
                "id": id,
                "login[unique_id]": login_unique_id,
                "login[password]": login_password,
                "login[sis_user_id]": login_sis_user_id,
                "login[integration_id]": login_integration_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end