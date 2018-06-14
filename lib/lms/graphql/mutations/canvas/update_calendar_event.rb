require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateCalendarEvent < CanvasBaseMutation
          argument :id, ID, required: true
          argument :calendar_event_context_code, String, required: false
          argument :calendar_event_title, String, required: false
          argument :calendar_event_description, String, required: false
          argument :calendar_event_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :calendar_event_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :calendar_event_location_name, String, required: false
          argument :calendar_event_location_address, String, required: false
          argument :calendar_event_time_zone_edited, String, required: false
          argument :calendar_event_all_day, Boolean, required: false
          argument :calendar_event_child_event_data_X_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :calendar_event_child_event_data_X_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :calendar_event_child_event_data_X_context_code, String, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, calendar_event_context_code: nil, calendar_event_title: nil, calendar_event_description: nil, calendar_event_start_at: nil, calendar_event_end_at: nil, calendar_event_location_name: nil, calendar_event_location_address: nil, calendar_event_time_zone_edited: nil, calendar_event_all_day: nil, calendar_event_child_event_data_X_start_at: nil, calendar_event_child_event_data_X_end_at: nil, calendar_event_child_event_data_X_context_code: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_CALENDAR_EVENT",
              {
                "id": id,
                "calendar_event[context_code]": calendar_event_context_code,
                "calendar_event[title]": calendar_event_title,
                "calendar_event[description]": calendar_event_description,
                "calendar_event[start_at]": calendar_event_start_at,
                "calendar_event[end_at]": calendar_event_end_at,
                "calendar_event[location_name]": calendar_event_location_name,
                "calendar_event[location_address]": calendar_event_location_address,
                "calendar_event[time_zone_edited]": calendar_event_time_zone_edited,
                "calendar_event[all_day]": calendar_event_all_day,
                "calendar_event[child_event_data][X][start_at]": calendar_event_child_event_data_X_start_at,
                "calendar_event[child_event_data][X][end_at]": calendar_event_child_event_data_X_end_at,
                "calendar_event[child_event_data][X][context_code]": calendar_event_child_event_data_X_context_code              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end