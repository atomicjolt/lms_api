require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CoursesPreviewProcessedHtml < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :html, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, html: nil)
            ctx[:canvas_api].proxy(
              "COURSES_PREVIEW_PROCESSED_HTML",
              {
                "course_id": course_id,
                "html": html              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end