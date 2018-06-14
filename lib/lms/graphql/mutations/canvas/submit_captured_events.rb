require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SubmitCapturedEvent < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :quiz_id, ID, required: true
          argument :id, ID, required: true
          argument :quiz_submission_events, [String], required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, quiz_id:, id:, quiz_submission_events:)
            ctx[:canvas_api].proxy(
              "SUBMIT_CAPTURED_EVENTS",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id,
                "quiz_submission_events": quiz_submission_events              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end