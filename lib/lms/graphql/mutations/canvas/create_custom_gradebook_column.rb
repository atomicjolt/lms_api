require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/custom_column"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateCustomGradebookColumn < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :column_title, String, required: true
          argument :column_position, Int, required: false
          argument :column_hidden, Boolean, required: false
          argument :column_teacher_notes, Boolean, required: false
          argument :column_read_only, Boolean, required: false
          field :custom_column, LMS::GraphQL::Types::Canvas::CustomColumn, null: false
          def resolve(course_id:, column_title:, column_position: nil, column_hidden: nil, column_teacher_notes: nil, column_read_only: nil)
            ctx[:canvas_api].proxy(
              "CREATE_CUSTOM_GRADEBOOK_COLUMN",
              {
                "course_id": course_id,
                "column[title]": column_title,
                "column[position]": column_position,
                "column[hidden]": column_hidden,
                "column[teacher_notes]": column_teacher_notes,
                "column[read_only]": column_read_only              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end