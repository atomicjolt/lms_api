require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ProgressWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "queued"
          value "running"
          value "completed"
          value "failed"
        end
        class Progress < BaseType
          description "Progress. API Docs: https://canvas.instructure.com/doc/api/progress.html"
          field :id, ID, "the ID of the Progress object.Example: 1", null: true
          field :context_id, ID, "the context owning the job..Example: 1", null: true
          field :context_type, String, "Example: Account", null: true
          field :user_id, ID, "the id of the user who started the job.Example: 123", null: true
          field :tag, String, "the type of operation.Example: course_batch_update", null: true
          field :completion, Int, "percent completed.Example: 100", null: true
          field :workflow_state, ProgressWorkflowStateEnum, "the state of the job one of 'queued', 'running', 'completed', 'failed'.Example: completed", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "the time the job was created.Example: 2013-01-15T15:00:00Z", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "the time the job was last updated.Example: 2013-01-15T15:04:00Z", null: true
          field :message, String, "optional details about the job.Example: 17 courses processed", null: true
          field :results, String, "optional results of the job. omitted when job is still pending.Example: 123", null: true
          field :url, String, "url where a progress update can be retrieved.Example: https://canvas.example.edu/api/v1/progress/1", null: true

        end
      end
    end
  end
end