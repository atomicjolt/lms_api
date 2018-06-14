require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/column_datum"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateColumnDatum < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          argument :user_id, ID, required: true
          argument :column_data_content, String, required: true
          field :column_datum, LMS::GraphQL::Types::Canvas::ColumnDatum, null: false
          def resolve(course_id:, id:, user_id:, column_data_content:)
            ctx[:canvas_api].proxy(
              "UPDATE_COLUMN_DATA",
              {
                "course_id": course_id,
                "id": id,
                "user_id": user_id,
                "column_data[content]": column_data_content              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end