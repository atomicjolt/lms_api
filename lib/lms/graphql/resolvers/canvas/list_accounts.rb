require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAccount < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Account], null: false
          argument :include, String, required: false
          def resolve(include: nil)
            context[:canvas_api].proxy(
              "LIST_ACCOUNTS",
              {
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end