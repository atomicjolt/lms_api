require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_epub_export"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCoursesWithTheirLatestEpubExport < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CourseEpubExport], null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_COURSES_WITH_THEIR_LATEST_EPUB_EXPORT",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end