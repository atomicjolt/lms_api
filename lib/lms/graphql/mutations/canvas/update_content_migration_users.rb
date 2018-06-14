require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateContentMigrationUser < CanvasBaseMutation
          argument :user_id, ID, required: true
          argument :id, ID, required: true
          field :content_migration, LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          def resolve(user_id:, id:)
            ctx[:canvas_api].proxy(
              "UPDATE_CONTENT_MIGRATION_USERS",
              {
                "user_id": user_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end