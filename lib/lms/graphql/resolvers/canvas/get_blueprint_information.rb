require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_template"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetBlueprintInformation < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::BlueprintTemplate, null: false
          argument :course_id, String, required: true
          argument :template_id, String, required: true
          def resolve(course_id:, template_id:)
            context[:canvas_api].proxy(
              "GET_BLUEPRINT_INFORMATION",
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