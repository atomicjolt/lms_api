require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class File < BaseType
          description "Plagiarism Detection Submissions. API Docs: https://canvas.instructure.com/doc/api/plagiarism_detection_submissions.html"
          field :size, Int, "Example: 4", null: true
          field :content_type, String, "Example: text/plain", null: true
          field :url, String, "Example: http://www.example.com/files/569/download?download_frd=1&verifier=c6HdZmxOZa0Fiin2cbvZeI8I5ry7yqD7RChQzb6P", null: true
          field :id, Int, "Example: 569", null: true
          field :display_name, String, "Example: file.txt", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", null: true

        end
      end
    end
  end
end