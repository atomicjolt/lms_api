require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFileCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::File, null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, id:, include: nil)
            context[:canvas_api].proxy(
              "GET_FILE_COURSES",
              {
                "course_id": course_id,
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end