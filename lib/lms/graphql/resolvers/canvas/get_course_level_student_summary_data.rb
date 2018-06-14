require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCourseLevelStudentSummaryDatum < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :sort_column, String, required: false
          argument :student_id, String, required: false
          def resolve(course_id:, sort_column: nil, student_id: nil)
            context[:canvas_api].proxy(
              "GET_COURSE_LEVEL_STUDENT_SUMMARY_DATA",
              {
                "course_id": course_id,
                "sort_column": sort_column,
                "student_id": student_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end