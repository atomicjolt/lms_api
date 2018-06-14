require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ResetCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          field :course, LMS::GraphQL::Types::Canvas::Course, null: false
          def resolve(course_id:)
            ctx[:canvas_api].proxy(
              "RESET_COURSE",
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