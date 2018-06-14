require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSinglePoll < CanvasBaseMutation
          argument :polls_question, String, required: true
          argument :polls_description, String, required: false
          field :return_value, Boolean, null: false
          def resolve(polls_question:, polls_description: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SINGLE_POLL",
              {
                "polls[question]": polls_question,
                "polls[description]": polls_description              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end