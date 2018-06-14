require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleSubmissionSection < CanvasBaseResolver
          type Boolean, null: false
          argument :section_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :user_id, ID, required: true
          argument :include, String, required: false
          def resolve(section_id:, assignment_id:, user_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_SUBMISSION_SECTIONS",
              {
                "section_id": section_id,
                "assignment_id": assignment_id,
                "user_id": user_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end