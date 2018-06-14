require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteCalendarEvent < CanvasBaseMutation
          argument :id, String, required: true
          argument :cancel_reason, String, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, cancel_reason: nil)
            ctx[:canvas_api].proxy(
              "DELETE_CALENDAR_EVENT",
              {
                "id": id,
                "cancel_reason": cancel_reason              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end