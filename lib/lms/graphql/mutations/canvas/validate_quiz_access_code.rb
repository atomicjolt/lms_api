require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ValidateQuizAccessCode < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :access_code, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, id:, access_code:)
            ctx[:canvas_api].proxy(
              "VALIDATE_QUIZ_ACCESS_CODE",
              {
                "course_id": course_id,
                "id": id,
                "access_code": access_code              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end