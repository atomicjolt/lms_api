require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReorderCustomColumn < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :order, Int, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, order:)
            ctx[:canvas_api].proxy(
              "REORDER_CUSTOM_COLUMNS",
              {
                "course_id": course_id,
                "order": order              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end