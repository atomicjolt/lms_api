require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RejectCourseInvitation < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "REJECT_COURSE_INVITATION",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end