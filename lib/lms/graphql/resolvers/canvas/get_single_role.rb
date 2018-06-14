require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/role"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleRole < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Role, null: false
          argument :id, ID, required: true
          argument :account_id, ID, required: true
          argument :role_id, ID, required: true
          argument :role, String, required: false
          def resolve(id:, account_id:, role_id:, role: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_ROLE",
              {
                "id": id,
                "account_id": account_id,
                "role_id": role_id,
                "role": role              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end