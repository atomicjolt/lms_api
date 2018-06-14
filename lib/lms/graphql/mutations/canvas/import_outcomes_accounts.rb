require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_import"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ImportOutcomesAccount < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :import_type, String, required: false
          argument :attachment, String, required: false
          argument :extension, String, required: false
          field :outcome_import, LMS::GraphQL::Types::Canvas::OutcomeImport, null: false
          def resolve(account_id:, import_type: nil, attachment: nil, extension: nil)
            ctx[:canvas_api].proxy(
              "IMPORT_OUTCOMES_ACCOUNTS",
              {
                "account_id": account_id,
                "import_type": import_type,
                "attachment": attachment,
                "extension": extension              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end