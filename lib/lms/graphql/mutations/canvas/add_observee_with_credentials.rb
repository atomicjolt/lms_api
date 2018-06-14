require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddObserveeWithCredential < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :observee_unique_id, String, required: false
          argument :observee_password, String, required: false
          argument :access_token, String, required: false
          argument :root_account_id, Int, required: false
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(user_id:, observee_unique_id: nil, observee_password: nil, access_token: nil, root_account_id: nil)
            ctx[:canvas_api].proxy(
              "ADD_OBSERVEE_WITH_CREDENTIALS",
              {
                "user_id": user_id,
                "observee[unique_id]": observee_unique_id,
                "observee[password]": observee_password,
                "access_token": access_token,
                "root_account_id": root_account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end