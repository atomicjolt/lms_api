require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/course_nickname"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SetCourseNickname < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :nickname, String, required: true
          field :course_nickname, LMS::GraphQL::Types::Canvas::CourseNickname, null: false
          def resolve(course_id:, nickname:)
            ctx[:canvas_api].proxy(
              "SET_COURSE_NICKNAME",
              {
                "course_id": course_id,
                "nickname": nickname              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end