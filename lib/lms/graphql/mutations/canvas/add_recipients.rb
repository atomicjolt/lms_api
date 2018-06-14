require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddRecipient < CanvasBaseMutation
          argument :id, String, required: true
          argument :recipients, String, required: true
          field :return_value, Boolean, null: false
          def resolve(id:, recipients:)
            ctx[:canvas_api].proxy(
              "ADD_RECIPIENTS",
              {
                "id": id,
                "recipients": recipients              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end