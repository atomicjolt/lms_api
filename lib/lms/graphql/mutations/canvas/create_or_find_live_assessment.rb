require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateOrFindLiveAssessment < CanvasBaseMutation
          argument :course_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:)
            ctx[:canvas_api].proxy(
              "CREATE_OR_FIND_LIVE_ASSESSMENT",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end