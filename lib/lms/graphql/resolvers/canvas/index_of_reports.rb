require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/report"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class IndexOfReport < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Report], null: false
          argument :account_id, ID, required: true
          argument :report, String, required: true
          def resolve(account_id:, report:)
            context[:canvas_api].proxy(
              "INDEX_OF_REPORTS",
              {
                "account_id": account_id,
                "report": report              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end