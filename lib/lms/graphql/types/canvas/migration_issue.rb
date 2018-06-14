require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class MigrationIssueWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "active"
          value "resolved"
        end

                class MigrationIssueIssueTypeEnum < ::GraphQL::Schema::Enum
          value "todo"
          value "warning"
          value "error"
        end
        class MigrationIssue < BaseType
          description "Content Migrations. API Docs: https://canvas.instructure.com/doc/api/content_migrations.html"
          field :id, ID, "the unique identifier for the issue.Example: 370663", null: true
          field :content_migration_url, String, "API url to the content migration.Example: https://example.com/api/v1/courses/1/content_migrations/1", null: true
          field :description, String, "Description of the issue for the end-user.Example: Questions in this quiz couldn't be converted", null: true
          field :workflow_state, MigrationIssueWorkflowStateEnum, "Current state of the issue: active, resolved.Example: active", null: true
          field :fix_issue_html_url, String, "HTML Url to the Canvas page to investigate the issue.Example: https://example.com/courses/1/quizzes/2", null: true
          field :issue_type, MigrationIssueIssueTypeEnum, "Severity of the issue: todo, warning, error.Example: warning", null: true
          field :error_report_html_url, String, "Link to a Canvas error report if present (If the requesting user has permissions).Example: https://example.com/error_reports/3", null: true
          field :error_message, String, "Site administrator error message (If the requesting user has permissions).Example: admin only message", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", null: true

        end
      end
    end
  end
end