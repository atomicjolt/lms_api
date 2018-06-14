require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class MediaComment < BaseType
          description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
          field :content_type, String, "Example: audio/mp4", null: true
          field :display_name, String, "Example: something", null: true
          field :media_id, String, "Example: 3232", null: true
          field :media_type, String, "Example: audio", null: true
          field :url, String, "Example: http://example.com/media_url", null: true

        end
      end
    end
  end
end