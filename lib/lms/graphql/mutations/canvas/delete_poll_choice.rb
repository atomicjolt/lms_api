require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeletePollChoice < CanvasBaseMutation
          argument :poll_id, String, required: true
          argument :id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(poll_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_POLL_CHOICE",
              {
                "poll_id": poll_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end