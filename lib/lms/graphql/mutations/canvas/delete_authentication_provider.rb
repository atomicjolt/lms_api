require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteAuthenticationProvider < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_AUTHENTICATION_PROVIDER",
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