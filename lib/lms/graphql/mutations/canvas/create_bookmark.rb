require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/bookmark"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateBookmark < CanvasBaseMutation
          argument :name, String, required: false
          argument :url, String, required: false
          argument :position, Int, required: false
          argument :data, String, required: false
          field :bookmark, LMS::GraphQL::Types::Canvas::Bookmark, null: false
          def resolve(name: nil, url: nil, position: nil, data: nil)
            ctx[:canvas_api].proxy(
              "CREATE_BOOKMARK",
              {
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