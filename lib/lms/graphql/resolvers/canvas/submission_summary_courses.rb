require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class SubmissionSummaryCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :grouped, Boolean, required: false
          def resolve(course_id:, assignment_id:, grouped: nil)
            context[:canvas_api].proxy(
              "SUBMISSION_SUMMARY_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "grouped": grouped              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end