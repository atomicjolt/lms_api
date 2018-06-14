require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/tab"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateTabForCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :tab_id, ID, required: true
          argument :position, Int, required: false
          argument :hidden, Boolean, required: false
          field :tab, LMS::GraphQL::Types::Canvas::Tab, null: false
          def resolve(course_id:, tab_id:, position: nil, hidden: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_TAB_FOR_COURSE",
              {
                "course_id": course_id,
                "tab_id": tab_id,
                "position": position,
                "hidden": hidden              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end