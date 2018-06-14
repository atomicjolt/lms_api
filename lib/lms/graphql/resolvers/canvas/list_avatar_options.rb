require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/avatar"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAvatarOption < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Avatar], null: false
          argument :user_id, String, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_AVATAR_OPTIONS",
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