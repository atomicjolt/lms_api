require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/report"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteReport < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :report, String, required: true
          argument :id, ID, required: true
          field :report, LMS::GraphQL::Types::Canvas::Report, null: false
          def resolve(account_id:, report:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_REPORT",
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