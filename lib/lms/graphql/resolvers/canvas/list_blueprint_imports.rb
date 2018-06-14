require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListBlueprintImport < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::BlueprintMigration], null: false
          argument :course_id, String, required: true
          argument :subscription_id, String, required: true
          def resolve(course_id:, subscription_id:)
            context[:canvas_api].proxy(
              "LIST_BLUEPRINT_IMPORTS",
              {
                "course_id": course_id,
                "subscription_id": subscription_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end