require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteAssignment < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          field :assignment, LMS::GraphQL::Types::Canvas::Assignment, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_ASSIGNMENT",
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