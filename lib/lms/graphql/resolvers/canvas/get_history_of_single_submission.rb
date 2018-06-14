require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetHistoryOfSingleSubmission < CanvasBaseResolver
          type Boolean, null: false
          argument :assignment_id, String, required: true
          argument :submission_id, String, required: true
          def resolve(assignment_id:, submission_id:)
            context[:canvas_api].proxy(
              "GET_HISTORY_OF_SINGLE_SUBMISSION",
              {
                "assignment_id": assignment_id,
                "submission_id": submission_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end