require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ContentMigrationWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "pre_processing"
          value "pre_processed"
          value "running"
          value "waiting_for_select"
          value "completed"
          value "failed"
        end
        class ContentMigration < BaseType
          description "Content Migrations. API Docs: https://canvas.instructure.com/doc/api/content_migrations.html"
          field :id, Int, "the unique identifier for the migration.Example: 370663", null: true
          field :migration_type, String, "the type of content migration.Example: common_cartridge_importer", null: true
          field :migration_type_title, String, "the name of the content migration type.Example: Canvas Cartridge Importer", null: true
          field :migration_issues_url, String, "API url to the content migration's issues.Example: https://example.com/api/v1/courses/1/content_migrations/1/migration_issues", null: true
          field :attachment, String, "attachment api object for the uploaded file may not be present for all migrations.Example: {'url'=>'https://example.com/api/v1/courses/1/content_migrations/1/download_archive'}", null: true
          field :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", null: true
          field :user_id, Int, "The user who started the migration.Example: 4", null: true
          field :workflow_state, ContentMigrationWorkflowStateEnum, "Current state of the content migration: pre_processing, pre_processed, running, waiting_for_select, completed, failed.Example: running", null: true
          field :started_at, LMS::GraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", null: true
          field :finished_at, LMS::GraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", null: true
          field :pre_attachment, String, "file uploading data, see {file:file_uploads.html File Upload Documentation} for file upload workflow This works a little differently in that all the file data is in the pre_attachment hash if there is no upload_url then there was an attachment pre-processing error, the error message will be in the message key This data will only be here after a create or update call.Example: {'upload_url'=>'', 'message'=>'file exceeded quota', 'upload_params'=>{}}", null: true

        end
      end
    end
  end
end