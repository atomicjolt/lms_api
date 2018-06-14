require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Appointment < BaseType
          description "Appointment Groups. API Docs: https://canvas.instructure.com/doc/api/appointment_groups.html"
          field :id, ID, "The appointment identifier..Example: 987", null: true
          field :start_at, LMS::GraphQL::Types::DateTimeType, "Start time for the appointment.Example: 2012-07-20T15:00:00-06:00", null: true
          field :end_at, LMS::GraphQL::Types::DateTimeType, "End time for the appointment.Example: 2012-07-20T15:00:00-06:00", null: true

        end
      end
    end
  end
end