require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowContentExportUser < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::ContentExport, null: false
          argument :user_id, String, required: true
          argument :id, String, required: true
          def resolve(user_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_CONTENT_EXPORT_USERS",
              {
                "user_id": user_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end