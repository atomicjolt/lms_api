require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAccountsForCourseAdmin < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Account], null: false

          def resolve()
            context[:canvas_api].proxy(
              "LIST_ACCOUNTS_FOR_COURSE_ADMINS",
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