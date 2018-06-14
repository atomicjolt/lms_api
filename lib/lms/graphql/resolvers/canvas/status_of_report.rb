require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class StatusOfReport < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Report, null: false
          argument :account_id, ID, required: true
          argument :report, String, required: true
          argument :id, ID, required: true
          def resolve(account_id:, report:, id:)
            context[:canvas_api].proxy(
              "STATUS_OF_REPORT",
              {
                "account_id": account_id,
                "report": report,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end