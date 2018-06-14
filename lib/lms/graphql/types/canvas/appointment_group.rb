require_relative "../canvas_base_type"
require_relative "appointment"
require_relative "calendar_event"
require_relative "calendar_event"

module LMS
  module GraphQL
    module Types
      module Canvas
        class AppointmentGroupWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "pending"
          value "active"
          value "deleted"
        end

                class AppointmentGroupParticipantVisibilityEnum < ::GraphQL::Schema::Enum
          value "private"
          value "protected"
        end

                class AppointmentGroupParticipantTypeEnum < ::GraphQL::Schema::Enum
          value "User"
          value "Group"
        end
        class AppointmentGroup < BaseType
          description "Appointment Groups. API Docs: https://canvas.instructure.com/doc/api/appointment_groups.html"
          field :id, ID, "The ID of the appointment group.Example: 543", null: true
          field :title, String, "The title of the appointment group.Example: Final Presentation", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "The start of the first time slot in the appointment group.Example: 2012-07-20T15:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "The end of the last time slot in the appointment group.Example: 2012-07-20T17:00:00-06:00", null: true
          field :description, String, "The text description of the appointment group.Example: Es muy importante", null: true
          field :location_name, String, "The location name of the appointment group.Example: El Tigre Chino's office", null: true
          field :location_address, String, "The address of the appointment group's location.Example: Room 234", null: true
          field :participant_count, Int, "The number of participant who have reserved slots (see include[] argument).Example: 2", null: true
          field :reserved_times, [LMS::GraphQL::Types::Canvas::Appointment], "The start and end times of slots reserved by the current user as well as the id of the calendar event for the reservation (see include[] argument).Example: {'id'=>987, 'start_at'=>'2012-07-20T15:00:00-06:00', 'end_at'=>'2012-07-20T15:00:00-06:00'}", null: true
          field :context_codes, String, "The context codes (i.e. courses) this appointment group belongs to. Only people in these courses will be eligible to sign up..Example: course_123", null: true
          field :sub_context_codes, Int, "The sub-context codes (i.e. course sections and group categories) this appointment group is restricted to.Example: course_section_234", null: true
          field :workflow_state, AppointmentGroupWorkflowStateEnum, "Current state of the appointment group ('pending', 'active' or 'deleted'). 'pending' indicates that it has not been published yet and is invisible to participants..Example: active", null: true
          field :requiring_action, Boolean, "Boolean indicating whether the current user needs to sign up for this appointment group (i.e. it's reservable and the min_appointments_per_participant limit has not been met by this user)..Example: true", null: true
          field :appointments_count, Int, "Number of time slots in this appointment group.Example: 2", null: true
          field :appointments, [LMS::GraphQL::Types::Canvas::CalendarEvent], "Calendar Events representing the time slots (see include[] argument) Refer to the Calendar Events API for more information.", null: true
          field :new_appointments, [LMS::GraphQL::Types::Canvas::CalendarEvent], "Newly created time slots (same format as appointments above). Only returned in Create/Update responses where new time slots have been added.", null: true
          field :max_appointments_per_participant, Int, "Maximum number of time slots a user may register for, or null if no limit.Example: 1", null: true
          field :min_appointments_per_participant, Int, "Minimum number of time slots a user must register for. If not set, users do not need to sign up for any time slots.Example: 1", null: true
          field :participants_per_appointment, Int, "Maximum number of participants that may register for each time slot, or null if no limit.Example: 1", null: true
          field :participant_visibility, AppointmentGroupParticipantVisibilityEnum, "'private' means participants cannot see who has signed up for a particular time slot, 'protected' means that they can.Example: private", null: true
          field :participant_type, AppointmentGroupParticipantTypeEnum, "Indicates how participants sign up for the appointment group, either as individuals ('User') or in student groups ('Group'). Related to sub_context_codes (i.e. 'Group' signups always have a single group category).Example: User", null: true
          field :url, String, "URL for this appointment group (to update, delete, etc.).Example: https://example.com/api/v1/appointment_groups/543", null: true
          field :html_url, String, "URL for a user to view this appointment group.Example: http://example.com/appointment_groups/1", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When the appointment group was created.Example: 2012-07-13T10:55:20-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "When the appointment group was last updated.Example: 2012-07-13T10:55:20-06:00", null: true

        end
      end
    end
  end
end