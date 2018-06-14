require_relative "../canvas_base_type"
require_relative "media_comment"

module LMS
  module GraphQL
    module Types
      module Canvas
        class SubmissionComment < BaseType
          description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
          field :id, Int, "Example: 37", null: true
          field :author_id, Int, "Example: 134", null: true
          field :author_name, String, "Example: Toph Beifong", null: true
          field :author, String, "Abbreviated user object UserDisplay (see users API)..Example: {}", null: true
          field :comment, String, "Example: Well here's the thing.", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-01-01T01:00:00Z", null: true
          field :edited_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-01-02T01:00:00Z", null: true
          field :media_comment, LMS::GraphQL::Types::Canvas::MediaComment, "", null: true

        end
      end
    end
  end
end