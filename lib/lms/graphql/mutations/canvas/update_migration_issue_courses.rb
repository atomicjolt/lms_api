require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/migration_issue"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateMigrationIssueCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :content_migration_id, ID, required: true
          argument :id, ID, required: true
          argument :workflow_state, String, required: true
          field :migration_issue, LMS::GraphQL::Types::Canvas::MigrationIssue, null: false
          def resolve(course_id:, content_migration_id:, id:, workflow_state:)
            ctx[:canvas_api].proxy(
              "UPDATE_MIGRATION_ISSUE_COURSES",
              {
                "course_id": course_id,
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