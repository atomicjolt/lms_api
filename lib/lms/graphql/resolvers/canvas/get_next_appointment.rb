require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetNextAppointment < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CalendarEvent], null: false
          argument :appointment_group_ids, String, required: false
          def resolve(appointment_group_ids: nil)
            context[:canvas_api].proxy(
              "GET_NEXT_APPOINTMENT",
              {
                "appointment_group_ids": appointment_group_ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end