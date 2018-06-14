require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UsersUploadFile < CanvasBaseMutation
          argument :user_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(user_id:)
            ctx[:canvas_api].proxy(
              "USERS_UPLOAD_FILE",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end