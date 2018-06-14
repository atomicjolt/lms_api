require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment_term"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEnrollmentTerm < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::EnrollmentTerm], null: false
          argument :account_id, ID, required: true
          argument :workflow_state, String, required: false
          argument :include, String, required: false
          def resolve(account_id:, workflow_state: nil, include: nil)
            context[:canvas_api].proxy(
              "LIST_ENROLLMENT_TERMS",
              {
                "account_id": account_id,
                "workflow_state": workflow_state,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end