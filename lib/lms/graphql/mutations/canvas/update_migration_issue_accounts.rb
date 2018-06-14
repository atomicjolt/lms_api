require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/migration_issue"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateMigrationIssueAccount < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :content_migration_id, String, required: true
          argument :id, String, required: true
          argument :workflow_state, String, required: true
          field :migration_issue, LMS::GraphQL::Types::Canvas::MigrationIssue, null: false
          def resolve(account_id:, content_migration_id:, id:, workflow_state:)
            ctx[:canvas_api].proxy(
              "UPDATE_MIGRATION_ISSUE_ACCOUNTS",
              {
                "account_id": account_id,
                "content_migration_id": content_migration_id,
                "id": id,
                "workflow_state": workflow_state              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end