require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetOutcomeResultRollup < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :aggregate, String, required: false
          argument :user_ids, [ID], required: false
          argument :outcome_ids, [ID], required: false
          argument :include, String, required: false
          def resolve(course_id:, aggregate: nil, user_ids: nil, outcome_ids: nil, include: nil)
            context[:canvas_api].proxy(
              "GET_OUTCOME_RESULT_ROLLUPS",
              {
                "course_id": course_id,
                "aggregate": aggregate,
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