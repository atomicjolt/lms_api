require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_assignment_override_set_container"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RetrieveAssignmentOverriddenDatesForQuiz < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::QuizAssignmentOverrideSetContainer, null: false
          argument :course_id, ID, required: true
          argument :quiz_assignment_overrides_0_quiz_ids, Int, required: false
          def resolve(course_id:, quiz_assignment_overrides_0_quiz_ids: nil)
            context[:canvas_api].proxy(
              "RETRIEVE_ASSIGNMENT_OVERRIDDEN_DATES_FOR_QUIZZES",
              {
                "course_id": course_id,
                "quiz_assignment_overrides[0][quiz_ids]": quiz_assignment_overrides_0_quiz_ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end