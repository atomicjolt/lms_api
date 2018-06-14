require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleSubmission < CanvasBaseResolver
          type Boolean, null: false
          argument :assignment_id, ID, required: true
          argument :submission_id, ID, required: true
          def resolve(assignment_id:, submission_id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_SUBMISSION",
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