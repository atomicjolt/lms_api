require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/epub_export"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateEpubExport < CanvasBaseMutation
          argument :course_id, ID, required: true
          field :epub_export, LMS::GraphQL::Types::Canvas::EpubExport, null: false
          def resolve(course_id:)
            ctx[:canvas_api].proxy(
              "CREATE_EPUB_EXPORT",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end