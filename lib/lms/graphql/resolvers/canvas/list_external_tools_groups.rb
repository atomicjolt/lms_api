require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListExternalToolsGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :group_id, String, required: true
          argument :search_term, String, required: false
          argument :selectable, Boolean, required: false
          argument :include_parents, Boolean, required: false
          def resolve(group_id:, search_term: nil, selectable: nil, include_parents: nil)
            context[:canvas_api].proxy(
              "LIST_EXTERNAL_TOOLS_GROUPS",
              {
                "group_id": group_id,
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