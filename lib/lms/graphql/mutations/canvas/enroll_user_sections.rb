require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EnrollUserSection < CanvasBaseMutation
          argument :section_id, String, required: true
          argument :enrollment_user_id, String, required: true
          argument :enrollment_type, String, required: true
          argument :enrollment_role, String, required: false
          argument :enrollment_role_id, Int, required: false
          argument :enrollment_enrollment_state, String, required: false
          argument :enrollment_course_section_id, Int, required: false
          argument :enrollment_limit_privileges_to_course_section, Boolean, required: false
          argument :enrollment_notify, Boolean, required: false
          argument :enrollment_self_enrollment_code, String, required: false
          argument :enrollment_self_enrolled, Boolean, required: false
          argument :enrollment_associated_user_id, Int, required: false
          field :enrollment, LMS::GraphQL::Types::Canvas::Enrollment, null: false
          def resolve(section_id:, enrollment_user_id:, enrollment_type:, enrollment_role: nil, enrollment_role_id: nil, enrollment_enrollment_state: nil, enrollment_course_section_id: nil, enrollment_limit_privileges_to_course_section: nil, enrollment_notify: nil, enrollment_self_enrollment_code: nil, enrollment_self_enrolled: nil, enrollment_associated_user_id: nil)
            ctx[:canvas_api].proxy(
              "ENROLL_USER_SECTIONS",
              {
                "section_id": section_id,
                "enrollment[user_id]": enrollment_user_id,
                "enrollment[type]": enrollment_type,
                "enrollment[role]": enrollment_role,
                "enrollment[role_id]": enrollment_role_id,
                "enrollment[enrollment_state]": enrollment_enrollment_state,
                "enrollment[course_section_id]": enrollment_course_section_id,
                "enrollment[limit_privileges_to_course_section]": enrollment_limit_privileges_to_course_section,
                "enrollment[notify]": enrollment_notify,
                "enrollment[self_enrollment_code]": enrollment_self_enrollment_code,
                "enrollment[self_enrolled]": enrollment_self_enrolled,
                "enrollment[associated_user_id]": enrollment_associated_user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end