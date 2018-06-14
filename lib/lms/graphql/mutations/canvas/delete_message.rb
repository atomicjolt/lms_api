require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteMessage < CanvasBaseMutation
          argument :id, ID, required: true
          argument :remove, String, required: true
          field :return_value, Boolean, null: false
          def resolve(id:, remove:)
            ctx[:canvas_api].proxy(
              "DELETE_MESSAGE",
              {
                "id": id,
                "remove": remove              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end