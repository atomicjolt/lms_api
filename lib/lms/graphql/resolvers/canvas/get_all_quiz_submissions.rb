require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllQuizSubmission < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, quiz_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_ALL_QUIZ_SUBMISSIONS",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end