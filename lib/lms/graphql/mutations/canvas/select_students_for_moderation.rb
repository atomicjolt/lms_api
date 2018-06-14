require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SelectStudentsForModeration < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :student_ids, Float, required: false
          field :user, [LMS::GraphQL::Types::Canvas::User], null: false
          def resolve(course_id:, assignment_id:, student_ids: nil)
            ctx[:canvas_api].proxy(
              "SELECT_STUDENTS_FOR_MODERATION",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "student_ids": student_ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end