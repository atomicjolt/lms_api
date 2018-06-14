require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/license"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListLicensesUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::License], null: false
          argument :user_id, ID, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_LICENSES_USERS",
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