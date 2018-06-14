require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migrator"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListMigrationSystemsUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Migrator], null: false
          argument :user_id, String, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_MIGRATION_SYSTEMS_USERS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end