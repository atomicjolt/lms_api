require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/change_record"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetMigrationDetail < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::ChangeRecord], null: false
          argument :course_id, String, required: true
          argument :template_id, String, required: true
          argument :id, String, required: true
          def resolve(course_id:, template_id:, id:)
            context[:canvas_api].proxy(
              "GET_MIGRATION_DETAILS",
              {
                "course_id": course_id,
                "template_id": template_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end