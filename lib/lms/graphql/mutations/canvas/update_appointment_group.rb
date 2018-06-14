require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateAppointmentGroup < CanvasBaseMutation
          argument :id, String, required: true
          argument :appointment_group_context_codes, String, required: true
          argument :appointment_group_sub_context_codes, String, required: false
          argument :appointment_group_title, String, required: false
          argument :appointment_group_description, String, required: false
          argument :appointment_group_location_name, String, required: false
          argument :appointment_group_location_address, String, required: false
          argument :appointment_group_publish, Boolean, required: false
          argument :appointment_group_participants_per_appointment, Int, required: false
          argument :appointment_group_min_appointments_per_participant, Int, required: false
          argument :appointment_group_max_appointments_per_participant, Int, required: false
          argument :appointment_group_new_appointments_X, String, required: false
          argument :appointment_group_participant_visibility, String, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, appointment_group_context_codes:, appointment_group_sub_context_codes: nil, appointment_group_title: nil, appointment_group_description: nil, appointment_group_location_name: nil, appointment_group_location_address: nil, appointment_group_publish: nil, appointment_group_participants_per_appointment: nil, appointment_group_min_appointments_per_participant: nil, appointment_group_max_appointments_per_participant: nil, appointment_group_new_appointments_X: nil, appointment_group_participant_visibility: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_APPOINTMENT_GROUP",
              {
                "id": id,
                "appointment_group[context_codes]": appointment_group_context_codes,
                "appointment_group[sub_context_codes]": appointment_group_sub_context_codes,
                "appointment_group[title]": appointment_group_title,
                "appointment_group[description]": appointment_group_description,
                "appointment_group[location_name]": appointment_group_location_name,
                "appointment_group[location_address]": appointment_group_location_address,
                "appointment_group[publish]": appointment_group_publish,
                "appointment_group[participants_per_appointment]": appointment_group_participants_per_appointment,
                "appointment_group[min_appointments_per_participant]": appointment_group_min_appointments_per_participant,
                "appointment_group[max_appointments_per_participant]": appointment_group_max_appointments_per_participant,
                "appointment_group[new_appointments][X]": appointment_group_new_appointments_X,
                "appointment_group[participant_visibility]": appointment_group_participant_visibility              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end