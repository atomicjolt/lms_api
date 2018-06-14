require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateLiveAssessmentResult < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assessment_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, assessment_id:)
            ctx[:canvas_api].proxy(
              "CREATE_LIVE_ASSESSMENT_RESULTS",
              {
                "course_id": course_id,
                "assessment_id": assessment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end