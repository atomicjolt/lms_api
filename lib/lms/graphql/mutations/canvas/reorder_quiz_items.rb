require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReorderQuizItem < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          argument :order_id, Int, required: true
          argument :order_type, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, id:, order_id:, order_type: nil)
            ctx[:canvas_api].proxy(
              "REORDER_QUIZ_ITEMS",
              {
                "course_id": course_id,
                "id": id,
                "order[id]": order_id,
                "order[type]": order_type              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end