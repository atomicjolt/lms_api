require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAssociatedCourseInformation < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Course], null: false
          argument :course_id, String, required: true
          argument :template_id, String, required: true
          def resolve(course_id:, template_id:)
            context[:canvas_api].proxy(
              "GET_ASSOCIATED_COURSE_INFORMATION",
              {
                "course_id": course_id,
                "template_id": template_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end