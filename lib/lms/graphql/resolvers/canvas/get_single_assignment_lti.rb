require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/lti_assignment"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleAssignmentLti < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::LtiAssignment, null: false
          argument :assignment_id, ID, required: true
          argument :user_id, ID, required: false
          def resolve(assignment_id:, user_id: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_ASSIGNMENT_LTI",
              {
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