require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteFile < CanvasBaseMutation
          argument :id, ID, required: true
          argument :replace, Boolean, required: false
          field :file, LMS::GraphQL::Types::Canvas::File, null: false
          def resolve(id:, replace: nil)
            ctx[:canvas_api].proxy(
              "DELETE_FILE",
              {
                "id": id,
                "replace": replace              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end