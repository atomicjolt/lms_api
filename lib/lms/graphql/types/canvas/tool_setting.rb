require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ToolSetting < BaseType
          description "Originality Reports. API Docs: https://canvas.instructure.com/doc/api/originality_reports.html"
          field :resource_type_code, String, "the resource type code of the resource handler to use to display originality reports.Example: originality_reports", null: true
          field :resource_url, String, "a URL that may be used to override the launch URL inferred by the specified resource_type_code. If used a 'resource_type_code' must also be specified..Example: http://www.test.com/originality_report", null: true

        end
      end
    end
  end
end