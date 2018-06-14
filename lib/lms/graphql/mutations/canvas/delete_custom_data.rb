require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteCustomDatum < CanvasBaseMutation
          argument :user_id, ID, required: true
          argument :ns, String, required: true
          field :return_value, Boolean, null: false
          def resolve(user_id:, ns:)
            ctx[:canvas_api].proxy(
              "DELETE_CUSTOM_DATA",
              {
                "user_id": user_id,
                "ns": ns              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end