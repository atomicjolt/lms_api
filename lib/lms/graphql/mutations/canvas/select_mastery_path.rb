require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SelectMasteryPath < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :module_id, ID, required: true
          argument :id, ID, required: true
          argument :assignment_set_id, ID, required: false
          argument :student_id, ID, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, module_id:, id:, assignment_set_id: nil, student_id: nil)
            ctx[:canvas_api].proxy(
              "SELECT_MASTERY_PATH",
              {
                "course_id": course_id,
                "module_id": module_id,
                "id": id,
                "assignment_set_id": assignment_set_id,
                "student_id": student_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end