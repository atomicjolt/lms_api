require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEnrollmentsUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Enrollment], null: false
          argument :type, String, required: false
          argument :role, String, required: false
          argument :state, String, required: false
          argument :include, String, required: false
          argument :user_id, String, required: true
          argument :grading_period_id, Int, required: false
          argument :enrollment_term_id, Int, required: false
          argument :sis_account_id, String, required: false
          argument :sis_course_id, String, required: false
          argument :sis_section_id, String, required: false
          argument :sis_user_id, String, required: false
          def resolve(type: nil, role: nil, state: nil, include: nil, user_id:, grading_period_id: nil, enrollment_term_id: nil, sis_account_id: nil, sis_course_id: nil, sis_section_id: nil, sis_user_id: nil)
            context[:canvas_api].proxy(
              "LIST_ENROLLMENTS_USERS",
              {
                "type": type,
                "role": role,
                "state": state,
                "include": include,
                "user_id": user_id,
                "grading_period_id": grading_period_id,
                "enrollment_term_id": enrollment_term_id,
                "sis_account_id": sis_account_id,
                "sis_course_id": sis_course_id,
                "sis_section_id": sis_section_id,
                "sis_user_id": sis_user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end