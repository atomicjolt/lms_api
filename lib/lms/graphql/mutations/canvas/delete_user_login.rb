require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteUserLogin < CanvasBaseMutation
          argument :user_id, ID, required: true
          argument :id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(user_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_USER_LOGIN",
              {
                "user_id": user_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end