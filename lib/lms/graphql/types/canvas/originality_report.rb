require_relative "../canvas_base_type"
require_relative "tool_setting"

module LMS
  module GraphQL
    module Types
      module Canvas
        class OriginalityReport < BaseType
          description "Originality Reports. API Docs: https://canvas.instructure.com/doc/api/originality_reports.html"
          field :id, Int, "The id of the OriginalityReport.Example: 4", null: true
          field :file_id, Int, "The id of the file receiving the originality score.Example: 8", null: true
          field :originality_score, Float, "A number between 0 and 100 representing the originality score.Example: 0.16", null: true
          field :originality_report_file_id, Int, "The ID of the file within Canvas containing the originality report document (if provided).Example: 23", null: true
          field :originality_report_url, String, "A non-LTI launch URL where the originality score of the file may be found..Example: http://www.example.com/report", null: true
          field :tool_setting, String, "A ToolSetting object containing optional 'resource_type_code' and 'resource_url'.", null: true

        end
      end
    end
  end
end