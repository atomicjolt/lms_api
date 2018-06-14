require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class SubmissionSummarySection < CanvasBaseResolver
          type Boolean, null: false
          argument :section_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :grouped, Boolean, required: false
          def resolve(section_id:, assignment_id:, grouped: nil)
            context[:canvas_api].proxy(
              "SUBMISSION_SUMMARY_SECTIONS",
              {
                "section_id": section_id,
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