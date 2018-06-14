require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListRevisionsGroup < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PageRevision], null: false
          argument :group_id, ID, required: true
          argument :url, String, required: true
          def resolve(group_id:, url:)
            context[:canvas_api].proxy(
              "LIST_REVISIONS_GROUPS",
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