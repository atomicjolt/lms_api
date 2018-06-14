require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListLiveAssessmentResult < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :assessment_id, String, required: true
          argument :user_id, Int, required: false
          def resolve(course_id:, assessment_id:, user_id: nil)
            context[:canvas_api].proxy(
              "LIST_LIVE_ASSESSMENT_RESULTS",
              {
                "course_id": course_id,
                "assessment_id": assessment_id,
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end