require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/jwt"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateJwt < CanvasBaseMutation

          field :jwt, LMS::GraphQL::Types::Canvas::JWT, null: false
          def resolve()
            ctx[:canvas_api].proxy(
              "CREATE_JWT",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end