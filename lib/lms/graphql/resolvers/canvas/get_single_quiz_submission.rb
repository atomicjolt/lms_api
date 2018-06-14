require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleQuizSubmission < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :quiz_id, ID, required: true
          argument :id, ID, required: true
          argument :include, String, required: false
          def resolve(course_id:, quiz_id:, id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_QUIZ_SUBMISSION",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end