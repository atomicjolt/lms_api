require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import_error"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSisImportErrorListSisImportError < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::SisImportError], null: false
          argument :account_id, String, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "GET_SIS_IMPORT_ERROR_LIST_SIS_IMPORT_ERRORS",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end