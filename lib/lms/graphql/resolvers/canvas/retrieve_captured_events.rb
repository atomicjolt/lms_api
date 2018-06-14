require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RetrieveCapturedEvent < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :id, String, required: true
          argument :attempt, Int, required: false
          def resolve(course_id:, quiz_id:, id:, attempt: nil)
            context[:canvas_api].proxy(
              "RETRIEVE_CAPTURED_EVENTS",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id,
                "attempt": attempt              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end