require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCalendarEventsForUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CalendarEvent], null: false
          argument :user_id, String, required: true
          argument :type, String, required: false
          argument :start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :undated, Boolean, required: false
          argument :all_events, Boolean, required: false
          argument :context_codes, String, required: false
          argument :excludes, [String], required: false
          def resolve(user_id:, type: nil, start_date: nil, end_date: nil, undated: nil, all_events: nil, context_codes: nil, excludes: nil)
            context[:canvas_api].proxy(
              "LIST_CALENDAR_EVENTS_FOR_USER",
              {
                "user_id": user_id,
                "type": type,
                "start_date": start_date,
                "end_date": end_date,
                "undated": undated,
                "all_events": all_events,
                "context_codes": context_codes,
                "excludes": excludes              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end