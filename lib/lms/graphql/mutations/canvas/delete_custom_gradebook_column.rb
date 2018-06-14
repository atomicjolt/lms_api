require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/custom_column"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteCustomGradebookColumn < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          field :custom_column, LMS::GraphQL::Types::Canvas::CustomColumn, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_CUSTOM_GRADEBOOK_COLUMN",
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