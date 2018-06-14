require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListMigrationIssuesGroup < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::MigrationIssue], null: false
          argument :group_id, ID, required: true
          argument :content_migration_id, ID, required: true
          def resolve(group_id:, content_migration_id:)
            context[:canvas_api].proxy(
              "LIST_MIGRATION_ISSUES_GROUPS",
              {
                "group_id": group_id,
                "content_migration_id": content_migration_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end