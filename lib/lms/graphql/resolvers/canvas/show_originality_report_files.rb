require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/originality_report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowOriginalityReportFile < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OriginalityReport, null: false
          argument :assignment_id, ID, required: true
          argument :file_id, ID, required: true
          def resolve(assignment_id:, file_id:)
            context[:canvas_api].proxy(
              "SHOW_ORIGINALITY_REPORT_FILES",
              {
                "assignment_id": assignment_id,
                "file_id": file_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end