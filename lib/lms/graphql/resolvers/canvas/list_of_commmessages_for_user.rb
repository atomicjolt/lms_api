require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/comm_message"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListOfCommmessagesForUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CommMessage], null: false
          argument :user_id, ID, required: true
          argument :start_time, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_time, LMS::GraphQL::Types::DateTimeType, required: false
          def resolve(user_id:, start_time: nil, end_time: nil)
            context[:canvas_api].proxy(
              "LIST_OF_COMMMESSAGES_FOR_USER",
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