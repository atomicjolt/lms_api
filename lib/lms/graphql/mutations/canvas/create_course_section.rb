require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateCourseSection < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :course_section_name, String, required: false
          argument :course_section_sis_section_id, String, required: false
          argument :course_section_integration_id, String, required: false
          argument :course_section_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_section_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_section_restrict_enrollments_to_section_dates, Boolean, required: false
          argument :enable_sis_reactivation, Boolean, required: false
          field :section, LMS::GraphQL::Types::Canvas::Section, null: false
          def resolve(course_id:, course_section_name: nil, course_section_sis_section_id: nil, course_section_integration_id: nil, course_section_start_at: nil, course_section_end_at: nil, course_section_restrict_enrollments_to_section_dates: nil, enable_sis_reactivation: nil)
            ctx[:canvas_api].proxy(
              "CREATE_COURSE_SECTION",
              {
                "course_id": course_id,
                "course_section[name]": course_section_name,
                "course_section[sis_section_id]": course_section_sis_section_id,
                "course_section[integration_id]": course_section_integration_id,
                "course_section[start_at]": course_section_start_at,
                "course_section[end_at]": course_section_end_at,
                "course_section[restrict_enrollments_to_section_dates]": course_section_restrict_enrollments_to_section_dates,
                "enable_sis_reactivation": enable_sis_reactivation              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end