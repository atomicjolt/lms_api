require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/rubric"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleRubricCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Rubric, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :include, String, required: false
          argument :style, String, required: false
          def resolve(course_id:, id:, include: nil, style: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_RUBRIC_COURSES",
              {
                "course_id": course_id,
                "id": id,
                "include": include,
                "style": style              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end