require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SendMessageToUnsubmittedOrSubmittedUsersForQuiz < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :conversations, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, id:, conversations: nil)
            ctx[:canvas_api].proxy(
              "SEND_MESSAGE_TO_UNSUBMITTED_OR_SUBMITTED_USERS_FOR_QUIZ",
              {
                "course_id": course_id,
                "id": id,
                "conversations": conversations              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end