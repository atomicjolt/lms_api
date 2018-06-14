require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSinglePollChoice < CanvasBaseMutation
          argument :poll_id, String, required: true
          argument :poll_choices_text, String, required: true
          argument :poll_choices_is_correct, Boolean, required: false
          argument :poll_choices_position, Int, required: false
          field :return_value, Boolean, null: false
          def resolve(poll_id:, poll_choices_text:, poll_choices_is_correct: nil, poll_choices_position: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SINGLE_POLL_CHOICE",
              {
                "poll_id": poll_id,
                "poll_choices[text]": poll_choices_text,
                "poll_choices[is_correct]": poll_choices_is_correct,
                "poll_choices[position]": poll_choices_position              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end