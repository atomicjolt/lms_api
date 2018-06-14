require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/scope"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListScope < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Scope], null: false
          argument :account_id, String, required: true
          argument :group_by, String, required: false
          def resolve(account_id:, group_by: nil)
            context[:canvas_api].proxy(
              "LIST_SCOPES",
              {
                "account_id": account_id,
                "group_by": group_by              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end