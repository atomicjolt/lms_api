require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleCourseAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Course, null: false
          argument :account_id, String, required: true
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(account_id:, id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_COURSE_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end