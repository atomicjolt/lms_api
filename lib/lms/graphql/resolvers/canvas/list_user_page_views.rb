require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_view"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUserPageView < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PageView], null: false
          argument :user_id, ID, required: true
          argument :start_time, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_time, LMS::GraphQL::Types::DateTimeType, required: false
          def resolve(user_id:, start_time: nil, end_time: nil)
            context[:canvas_api].proxy(
              "LIST_USER_PAGE_VIEWS",
              {
                "user_id": user_id,
                "start_time": start_time,
                "end_time": end_time              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end