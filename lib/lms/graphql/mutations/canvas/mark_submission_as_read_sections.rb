require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class MarkSubmissionAsReadSection < CanvasBaseMutation
          argument :section_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :user_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(section_id:, assignment_id:, user_id:)
            ctx[:canvas_api].proxy(
              "MARK_SUBMISSION_AS_READ_SECTIONS",
              {
                "section_id": section_id,
                "assignment_id": assignment_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end