require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListContentExportsGroup < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::ContentExport], null: false
          argument :group_id, ID, required: true
          def resolve(group_id:)
            context[:canvas_api].proxy(
              "LIST_CONTENT_EXPORTS_GROUPS",
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