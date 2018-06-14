require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSinglePollSubmission < CanvasBaseMutation
          argument :poll_id, ID, required: true
          argument :poll_session_id, ID, required: true
          argument :poll_submissions_poll_choice_id, Int, required: true
          field :return_value, Boolean, null: false
          def resolve(poll_id:, poll_session_id:, poll_submissions_poll_choice_id:)
            ctx[:canvas_api].proxy(
              "CREATE_SINGLE_POLL_SUBMISSION",
              {
                "poll_id": poll_id,
                "poll_session_id": poll_session_id,
                "poll_submissions[poll_choice_id]": poll_submissions_poll_choice_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end