require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/profile"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetUserProfile < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Profile, null: false
          argument :user_id, ID, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "GET_USER_PROFILE",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end