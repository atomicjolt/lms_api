require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowPageGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Page, null: false
          argument :group_id, ID, required: true
          argument :url, String, required: true
          def resolve(group_id:, url:)
            context[:canvas_api].proxy(
              "SHOW_PAGE_GROUPS",
              {
                "group_id": group_id,
                "url": url              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end