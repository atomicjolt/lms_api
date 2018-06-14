require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListRevisionsCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PageRevision], null: false
          argument :course_id, String, required: true
          argument :url, String, required: true
          def resolve(course_id:, url:)
            context[:canvas_api].proxy(
              "LIST_REVISIONS_COURSES",
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