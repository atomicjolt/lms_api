require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowRevisionCoursesLatest < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::PageRevision, null: false
          argument :course_id, String, required: true
          argument :url, String, required: true
          argument :summary, Boolean, required: false
          def resolve(course_id:, url:, summary: nil)
            context[:canvas_api].proxy(
              "SHOW_REVISION_COURSES_LATEST",
              {
                "course_id": course_id,
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