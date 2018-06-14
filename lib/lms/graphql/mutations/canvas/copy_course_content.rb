require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CopyCourseContent < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :source_course, String, required: false
          argument :except, String, required: false
          argument :only, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, source_course: nil, except: nil, only: nil)
            ctx[:canvas_api].proxy(
              "COPY_COURSE_CONTENT",
              {
                "course_id": course_id,
                "source_course": source_course,
                "except": except,
                "only": only              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end