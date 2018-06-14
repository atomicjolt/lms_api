require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AbortAllPendingSisImport < CanvasBaseMutation
          argument :account_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(account_id:)
            ctx[:canvas_api].proxy(
              "ABORT_ALL_PENDING_SIS_IMPORTS",
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