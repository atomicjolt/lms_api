require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowRevisionGroupsLatest < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::PageRevision, null: false
          argument :group_id, String, required: true
          argument :url, String, required: true
          argument :summary, Boolean, required: false
          def resolve(group_id:, url:, summary: nil)
            context[:canvas_api].proxy(
              "SHOW_REVISION_GROUPS_LATEST",
              {
                "group_id": group_id,
                "url": url,
                "summary": summary              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end