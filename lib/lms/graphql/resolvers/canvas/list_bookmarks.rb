require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/bookmark"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListBookmark < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Bookmark], null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_BOOKMARKS",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end