require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetOutcomeResult < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :user_ids, Int, required: false
          argument :outcome_ids, Int, required: false
          argument :include, String, required: false
          def resolve(course_id:, user_ids: nil, outcome_ids: nil, include: nil)
            context[:canvas_api].proxy(
              "GET_OUTCOME_RESULTS",
              {
                "course_id": course_id,
                "user_ids": user_ids,
                "outcome_ids": outcome_ids,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end