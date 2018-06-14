require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ShowObservee < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::User, null: false
          argument :user_id, ID, required: true
          argument :observee_id, ID, required: true
          def resolve(user_id:, observee_id:)
            context[:canvas_api].proxy(
              "SHOW_OBSERVEE",
              {
                "user_id": user_id,
                "observee_id": observee_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end