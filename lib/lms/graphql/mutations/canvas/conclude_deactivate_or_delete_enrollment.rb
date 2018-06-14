require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ConcludeDeactivateOrDeleteEnrollment < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :task, String, required: false
          field :enrollment, LMS::GraphQL::Types::Canvas::Enrollment, null: false
          def resolve(course_id:, id:, task: nil)
            ctx[:canvas_api].proxy(
              "CONCLUDE_DEACTIVATE_OR_DELETE_ENROLLMENT",
              {
                "course_id": course_id,
                "id": id,
                "task": task              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end