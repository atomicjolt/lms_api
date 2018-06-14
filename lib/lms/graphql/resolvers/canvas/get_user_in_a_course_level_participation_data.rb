require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetUserInACourseLevelParticipationDatum < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :student_id, ID, required: true
          def resolve(course_id:, student_id:)
            context[:canvas_api].proxy(
              "GET_USER_IN_A_COURSE_LEVEL_PARTICIPATION_DATA",
              {
                "course_id": course_id,
                "student_id": student_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end