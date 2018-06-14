require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListContentExportsUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::ContentExport], null: false
          argument :user_id, ID, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_CONTENT_EXPORTS_USERS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end