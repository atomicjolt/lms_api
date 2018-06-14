require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_nickname"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCourseNickname < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::CourseNickname, null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "GET_COURSE_NICKNAME",
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