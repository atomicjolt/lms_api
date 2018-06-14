require_relative "../canvas_base_type"
require_relative "file"

module LMS
  module GraphQL
    module Types
      module Canvas
        class EpubExportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "exporting"
          value "exported"
          value "generating"
          value "generated"
          value "failed"
        end
        class EpubExport < BaseType
          description "ePub Exports. API Docs: https://canvas.instructure.com/doc/api/e_pub_exports.html"
          field :id, Int, "the unique identifier for the export.Example: 101", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "the date and time this export was requested.Example: 2014-01-01T00:00:00Z", null: true
          field :attachment, LMS::GraphQL::Types::Canvas::File, "attachment api object for the export ePub (not present until the export completes).Example: https://example.com/api/v1/attachments/789?download_frd=1&verifier=bG9sY2F0cyEh", null: true
          field :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", null: true
          field :user_id, Int, "The ID of the user who started the export.Example: 4", null: true
          field :workflow_state, EpubExportWorkflowStateEnum, "Current state of the ePub export: created exporting exported generating generated failed.Example: exported", null: true

        end
      end
    end
  end
end