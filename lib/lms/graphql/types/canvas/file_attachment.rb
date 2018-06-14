require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class FileAttachment < BaseType
          description "Discussion Topics. API Docs: https://canvas.instructure.com/doc/api/discussion_topics.html"
          field :content_type, String, "Example: unknown/unknown", null: true
          field :url, String, "Example: http://www.example.com/courses/1/files/1/download", null: true
          field :filename, String, "Example: content.txt", null: true
          field :display_name, String, "Example: content.txt", null: true

        end
      end
    end
  end
end