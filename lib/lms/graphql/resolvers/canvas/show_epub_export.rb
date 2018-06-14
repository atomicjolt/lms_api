require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/epub_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowEpubExport < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::EpubExport, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_EPUB_EXPORT",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end