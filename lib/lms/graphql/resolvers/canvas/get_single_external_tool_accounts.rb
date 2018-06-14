require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleExternalToolAccount < CanvasBaseResolver
          type Boolean, null: false
          argument :account_id, String, required: true
          argument :external_tool_id, String, required: true
          def resolve(account_id:, external_tool_id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_EXTERNAL_TOOL_ACCOUNTS",
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