require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSisImportStatus < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::SisImport, null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "GET_SIS_IMPORT_STATUS",
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