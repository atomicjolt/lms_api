require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUsersInAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::User], null: false
          argument :account_id, ID, required: true
          argument :search_term, String, required: false
          argument :sort, String, required: false
          argument :order, String, required: false
          def resolve(account_id:, search_term: nil, sort: nil, order: nil)
            context[:canvas_api].proxy(
              "LIST_USERS_IN_ACCOUNT",
              {
                "account_id": account_id,
                "search_term": search_term,
                "sort": sort,
                "order": order              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end