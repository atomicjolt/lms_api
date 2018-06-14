require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFileFile < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::File, null: false
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(id:, include: nil)
            context[:canvas_api].proxy(
              "GET_FILE_FILES",
              {
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end