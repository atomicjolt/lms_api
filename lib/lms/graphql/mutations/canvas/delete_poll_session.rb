require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeletePollSession < CanvasBaseMutation
          argument :poll_id, ID, required: true
          argument :id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(poll_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_POLL_SESSION",
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