require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/originality_report"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateOriginalityReport < CanvasBaseMutation
          argument :assignment_id, String, required: true
          argument :submission_id, String, required: true
          argument :originality_report_file_id, Int, required: false
          argument :originality_report_originality_score, Float, required: true
          argument :originality_report_originality_report_url, String, required: false
          argument :originality_report_originality_report_file_id, Int, required: false
          argument :originality_report_tool_setting_resource_type_code, String, required: false
          argument :originality_report_tool_setting_resource_url, String, required: false
          argument :originality_report_workflow_state, String, required: false
          field :originality_report, LMS::GraphQL::Types::Canvas::OriginalityReport, null: false
          def resolve(assignment_id:, submission_id:, originality_report_file_id: nil, originality_report_originality_score:, originality_report_originality_report_url: nil, originality_report_originality_report_file_id: nil, originality_report_tool_setting_resource_type_code: nil, originality_report_tool_setting_resource_url: nil, originality_report_workflow_state: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ORIGINALITY_REPORT",
              {
                "assignment_id": assignment_id,
                "submission_id": submission_id,
                "originality_report[file_id]": originality_report_file_id,
                "originality_report[originality_score]": originality_report_originality_score,
                "originality_report[originality_report_url]": originality_report_originality_report_url,
                "originality_report[originality_report_file_id]": originality_report_originality_report_file_id,
                "originality_report[tool_setting][resource_type_code]": originality_report_tool_setting_resource_type_code,
                "originality_report[tool_setting][resource_url]": originality_report_tool_setting_resource_url,
                "originality_report[workflow_state]": originality_report_workflow_state              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end