require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_nickname"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCourseNickname < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CourseNickname], null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_COURSE_NICKNAMES",
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