require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleCalendarEventOrAssignment < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::CalendarEvent, null: false
          argument :id, ID, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_CALENDAR_EVENT_OR_ASSIGNMENT",
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