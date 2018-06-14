require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReserveTimeSlotParticipantId < CanvasBaseMutation
          argument :id, String, required: true
          argument :participant_id, String, required: true
          argument :comments, String, required: false
          argument :cancel_existing, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, participant_id:, comments: nil, cancel_existing: nil)
            ctx[:canvas_api].proxy(
              "RESERVE_TIME_SLOT_PARTICIPANT_ID",
              {
                "id": id,
                "participant_id": participant_id,
                "comments": comments,
                "cancel_existing": cancel_existing              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end