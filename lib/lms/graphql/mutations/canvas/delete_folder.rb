require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteFolder < CanvasBaseMutation
          argument :id, String, required: true
          argument :force, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, force: nil)
            ctx[:canvas_api].proxy(
              "DELETE_FOLDER",
              {
                "id": id,
                "force": force              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end