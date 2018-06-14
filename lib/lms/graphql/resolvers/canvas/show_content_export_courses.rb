require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowContentExportCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::ContentExport, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_CONTENT_EXPORT_COURSES",
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