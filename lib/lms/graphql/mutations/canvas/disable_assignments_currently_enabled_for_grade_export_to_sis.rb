require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DisableAssignmentsCurrentlyEnabledForGradeExportToSi < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :grading_period_id, ID, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, grading_period_id: nil)
            ctx[:canvas_api].proxy(
              "DISABLE_ASSIGNMENTS_CURRENTLY_ENABLED_FOR_GRADE_EXPORT_TO_SIS",
              {
                "course_id": course_id,
                "grading_period_id": grading_period_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end