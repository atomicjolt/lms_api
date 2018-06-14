require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAppointmentGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :scope, String, required: false
          argument :context_codes, String, required: false
          argument :include_past_appointments, Boolean, required: false
          argument :include, String, required: false
          def resolve(scope: nil, context_codes: nil, include_past_appointments: nil, include: nil)
            context[:canvas_api].proxy(
              "LIST_APPOINTMENT_GROUPS",
              {
                "scope": scope,
                "context_codes": context_codes,
                "include_past_appointments": include_past_appointments,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end