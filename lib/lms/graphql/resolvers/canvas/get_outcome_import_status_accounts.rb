require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_import"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetOutcomeImportStatusAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OutcomeImport, null: false
          argument :account_id, String, required: true
          argument :id, String, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "GET_OUTCOME_IMPORT_STATUS_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end