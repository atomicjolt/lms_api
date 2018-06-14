require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CalendarEvent < BaseType
          description "Calendar Events. API Docs: https://canvas.instructure.com/doc/api/calendar_events.html"
          field :id, ID, "The ID of the calendar event.Example: 234", null: true
          field :title, String, "The title of the calendar event.Example: Paintball Fight!", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The start timestamp of the event.Example: 2012-07-19T15:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The end timestamp of the event.Example: 2012-07-19T16:00:00-06:00", null: true
          field :description, String, "The HTML description of the event.Example: <b>It's that time again!</b>", null: true
          field :location_name, String, "The location name of the event.Example: Greendale Community College", null: true
          field :location_address, String, "The address where the event is taking place.Example: Greendale, Colorado", null: true
          field :context_code, String, "the context code of the calendar this event belongs to (course, user or group).Example: course_123", null: true
          field :effective_context_code, String, "if specified, it indicates which calendar this event should be displayed on. for example, a section-level event would have the course's context code here, while the section's context code would be returned above).", null: true
          field :all_context_codes, String, "a comma-separated list of all calendar contexts this event is part of.Example: course_123,course_456", null: true
          field :workflow_state, String, "Current state of the event ('active', 'locked' or 'deleted') 'locked' indicates that start_at/end_at cannot be changed (though the event could be deleted). Normally only reservations or time slots with reservations are locked (see the Appointment Groups API).Example: active", null: true
          field :hidden, Boolean, "Whether this event should be displayed on the calendar. Only true for course-level events with section-level child events..", null: true
          field :parent_event_id, ID, "Normally null. If this is a reservation (see the Appointment Groups API), the id will indicate the time slot it is for. If this is a section-level event, this will be the course-level parent event..", null: true
          field :child_events_count, Int, "The number of child_events. See child_events (and parent_event_id).Example: 0", null: true
          field :child_events, Int, "Included by default, but may be excluded (see include[] option). If this is a time slot (see the Appointment Groups API) this will be a list of any reservations. If this is a course-level event, this will be a list of section-level events (if any).", null: true
          field :url, String, "URL for this calendar event (to update, delete, etc.).Example: https://example.com/api/v1/calendar_events/234", null: true
          field :html_url, String, "URL for a user to view this event.Example: https://example.com/calendar?event_id=234&include_contexts=course_123", null: true
          field :all_day_date, LMS::GraphQL::Types::DateTimeType, "The date of this event.Example: 2012-07-19", null: true
          field :all_day, Boolean, "Boolean indicating whether this is an all-day event (midnight to midnight).", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When the calendar event was created.Example: 2012-07-12T10:55:20-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "When the calendar event was last updated.Example: 2012-07-12T10:55:20-06:00", null: true
          field :appointment_group_id, ID, "Various Appointment-Group-related fields.These fields are only pertinent to time slots (appointments) and reservations of those time slots. See the Appointment Groups API. The id of the appointment group.", null: true
          field :appointment_group_url, String, "The API URL of the appointment group.", null: true
          field :own_reservation, Boolean, "If the event is a reservation, this a boolean indicating whether it is the current user's reservation, or someone else's.", null: true
          field :reserve_url, String, "If the event is a time slot, the API URL for reserving it.", null: true
          field :reserved, Boolean, "If the event is a time slot, a boolean indicating whether the user has already made a reservation for it.", null: true
          field :participant_type, String, "The type of participant to sign up for a slot: 'User' or 'Group'.Example: User", null: true
          field :participants_per_appointment, Int, "If the event is a time slot, this is the participant limit.", null: true
          field :available_slots, Int, "If the event is a time slot and it has a participant limit, an integer indicating how many slots are available.", null: true
          field :user, String, "If the event is a user-level reservation, this will contain the user participant JSON (refer to the Users API)..", null: true
          field :group, String, "If the event is a group-level reservation, this will contain the group participant JSON (refer to the Groups API)..", null: true

        end
      end
    end
  end
end