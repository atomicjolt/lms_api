require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeletePageGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :url, String, required: true
          field :page, LMS::GraphQL::Types::Canvas::Page, null: false
          def resolve(group_id:, url:)
            ctx[:canvas_api].proxy(
              "DELETE_PAGE_GROUPS",
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