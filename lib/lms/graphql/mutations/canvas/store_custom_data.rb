require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class StoreCustomDatum < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :ns, String, required: true
          argument :data, String, required: true
          field :return_value, Boolean, null: false
          def resolve(user_id:, ns:, data:)
            ctx[:canvas_api].proxy(
              "STORE_CUSTOM_DATA",
              {
                "user_id": user_id,
                "ns": ns,
                "data": data              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end