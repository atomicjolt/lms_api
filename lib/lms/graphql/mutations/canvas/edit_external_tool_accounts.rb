require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EditExternalToolAccount < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :external_tool_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(account_id:, external_tool_id:)
            ctx[:canvas_api].proxy(
              "EDIT_EXTERNAL_TOOL_ACCOUNTS",
              {
                "account_id": account_id,
                "external_tool_id": external_tool_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end