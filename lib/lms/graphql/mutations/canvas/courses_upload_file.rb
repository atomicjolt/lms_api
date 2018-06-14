require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CoursesUploadFile < CanvasBaseMutation
          argument :course_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:)
            ctx[:canvas_api].proxy(
              "COURSES_UPLOAD_FILE",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end