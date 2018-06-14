require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateContentMigrationAccount < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          field :content_migration, LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "UPDATE_CONTENT_MIGRATION_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end