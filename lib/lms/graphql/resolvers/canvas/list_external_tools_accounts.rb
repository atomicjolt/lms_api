require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListExternalToolsAccount < CanvasBaseResolver
          type Boolean, null: false
          argument :account_id, ID, required: true
          argument :search_term, String, required: false
          argument :selectable, Boolean, required: false
          argument :include_parents, Boolean, required: false
          def resolve(account_id:, search_term: nil, selectable: nil, include_parents: nil)
            context[:canvas_api].proxy(
              "LIST_EXTERNAL_TOOLS_ACCOUNTS",
              {
                "account_id": account_id,
                "search_term": search_term,
                "selectable": selectable,
                "include_parents": include_parents              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end