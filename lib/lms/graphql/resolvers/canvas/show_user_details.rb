require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowUserDetail < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::User, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "SHOW_USER_DETAILS",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end