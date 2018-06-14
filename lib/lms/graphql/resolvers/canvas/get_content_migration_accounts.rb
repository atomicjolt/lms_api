require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetContentMigrationAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "GET_CONTENT_MIGRATION_ACCOUNTS",
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