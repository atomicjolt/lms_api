require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class PublishProvisionalGradesForAssignment < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, assignment_id:)
            ctx[:canvas_api].proxy(
              "PUBLISH_PROVISIONAL_GRADES_FOR_ASSIGNMENT",
              {
                "course_id": course_id,
                "assignment_id": assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end