require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/originality_report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowOriginalityReportSubmission < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OriginalityReport, null: false
          argument :assignment_id, String, required: true
          argument :submission_id, String, required: true
          argument :id, String, required: true
          def resolve(assignment_id:, submission_id:, id:)
            context[:canvas_api].proxy(
              "SHOW_ORIGINALITY_REPORT_SUBMISSIONS",
              {
                "assignment_id": assignment_id,
                "submission_id": submission_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end