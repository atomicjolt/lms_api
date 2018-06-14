require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowPageCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Page, null: false
          argument :course_id, String, required: true
          argument :url, String, required: true
          def resolve(course_id:, url:)
            context[:canvas_api].proxy(
              "SHOW_PAGE_COURSES",
              {
                "course_id": course_id,
                "url": url              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end