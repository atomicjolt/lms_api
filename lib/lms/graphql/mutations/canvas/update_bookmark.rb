require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateBookmark < CanvasBaseMutation
          argument :id, String, required: true
          argument :name, String, required: false
          argument :url, String, required: false
          argument :position, Int, required: false
          argument :data, String, required: false
          field :folder, LMS::GraphQL::Types::Canvas::Folder, null: false
          def resolve(id:, name: nil, url: nil, position: nil, data: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_BOOKMARK",
              {
                "id": id,
                "name": name,
                "url": url,
                "position": position,
                "data": data              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end