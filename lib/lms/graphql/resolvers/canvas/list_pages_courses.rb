require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListPagesCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Page], null: false
          argument :course_id, ID, required: true
          argument :sort, String, required: false
          argument :order, String, required: false
          argument :search_term, String, required: false
          argument :published, Boolean, required: false
          def resolve(course_id:, sort: nil, order: nil, search_term: nil, published: nil)
            context[:canvas_api].proxy(
              "LIST_PAGES_COURSES",
              {
                "course_id": course_id,
                "sort": sort,
                "order": order,
                "search_term": search_term,
                "published": published              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end