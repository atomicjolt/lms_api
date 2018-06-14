require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCourseSection < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Section], null: false
          argument :course_id, ID, required: true
          argument :include, String, required: false
          def resolve(course_id:, include: nil)
            context[:canvas_api].proxy(
              "LIST_COURSE_SECTIONS",
              {
                "course_id": course_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end