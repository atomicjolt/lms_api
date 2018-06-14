require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowFrontPageGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Page, null: false
          argument :group_id, String, required: true
          def resolve(group_id:)
            context[:canvas_api].proxy(
              "SHOW_FRONT_PAGE_GROUPS",
              {
                "group_id": group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end