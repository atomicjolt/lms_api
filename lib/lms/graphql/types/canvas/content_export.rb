require_relative "../canvas_base_type"
require_relative "file"

module LMS
  module GraphQL
    module Types
      module Canvas
        class ContentExportExportTypeEnum < ::GraphQL::Schema::Enum
          value "common_cartridge"
          value "qti"
        end

                class ContentExportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "exporting"
          value "exported"
          value "failed"
        end
        class ContentExport < BaseType
          description "Content Exports. API Docs: https://canvas.instructure.com/doc/api/content_exports.html"
          field :id, Int, "the unique identifier for the export.Example: 101", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "the date and time this export was requested.Example: 2014-01-01T00:00:00Z", null: true
          field :export_type, ContentExportExportTypeEnum, "the type of content migration: 'common_cartridge' or 'qti'.Example: common_cartridge", null: true
          field :attachment, LMS::GraphQL::Types::Canvas::File, "attachment api object for the export package (not present before the export completes or after it becomes unavailable for download.).Example: https://example.com/api/v1/attachments/789?download_frd=1&verifier=bG9sY2F0cyEh", null: true
          field :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", null: true
          field :user_id, Int, "The ID of the user who started the export.Example: 4", null: true
          field :workflow_state, ContentExportWorkflowStateEnum, "Current state of the content migration: created exporting exported failed.Example: exported", null: true

        end
      end
    end
  end
end