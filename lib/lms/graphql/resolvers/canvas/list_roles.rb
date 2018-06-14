require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/role"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListRole < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Role], null: false
          argument :account_id, String, required: true
          argument :state, String, required: false
          argument :show_inherited, Boolean, required: false
          def resolve(account_id:, state: nil, show_inherited: nil)
            context[:canvas_api].proxy(
              "LIST_ROLES",
              {
                "account_id": account_id,
                "state": state,
                "show_inherited": show_inherited              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end