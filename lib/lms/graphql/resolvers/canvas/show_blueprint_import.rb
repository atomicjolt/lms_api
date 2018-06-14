require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowBlueprintImport < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::BlueprintMigration, null: false
          argument :course_id, ID, required: true
          argument :subscription_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, subscription_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_BLUEPRINT_IMPORT",
              {
                "course_id": course_id,
                "subscription_id": subscription_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end