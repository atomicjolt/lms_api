require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/sis_import"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AbortSisImport < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :id, String, required: true
          field :sis_import, LMS::GraphQL::Types::Canvas::SisImport, null: false
          def resolve(account_id:, id:)
            ctx[:canvas_api].proxy(
              "ABORT_SIS_IMPORT",
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