require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import_error"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSisImportErrorListSisImport < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::SisImportError], null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "GET_SIS_IMPORT_ERROR_LIST_SIS_IMPORTS",
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