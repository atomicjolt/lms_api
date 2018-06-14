require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateContentMigrationGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :id, String, required: true
          field :content_migration, LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          def resolve(group_id:, id:)
            ctx[:canvas_api].proxy(
              "UPDATE_CONTENT_MIGRATION_GROUPS",
              {
                "group_id": group_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end