require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReserveTimeSlot < CanvasBaseMutation
          argument :id, ID, required: true
          argument :participant_id, ID, required: false
          argument :comments, String, required: false
          argument :cancel_existing, Boolean, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, participant_id: nil, comments: nil, cancel_existing: nil)
            ctx[:canvas_api].proxy(
              "RESERVE_TIME_SLOT",
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