require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class RetrieveAssignmentsEnabledForGradeExportToSisCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :account_id, Int, required: false
          argument :course_id, Int, required: true
          argument :starts_before, LMS::GraphQL::Types::DateTimeType, required: false
          argument :ends_after, LMS::GraphQL::Types::DateTimeType, required: false
          argument :include, String, required: false
          def resolve(account_id: nil, course_id:, starts_before: nil, ends_after: nil, include: nil)
            context[:canvas_api].proxy(
              "RETRIEVE_ASSIGNMENTS_ENABLED_FOR_GRADE_EXPORT_TO_SIS_COURSES",
              {
                "account_id": account_id,
                "course_id": course_id,
                "starts_before": starts_before,
                "ends_after": ends_after,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end