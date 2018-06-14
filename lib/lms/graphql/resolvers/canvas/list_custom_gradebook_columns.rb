require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/custom_column"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCustomGradebookColumn < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::CustomColumn], null: false
          argument :course_id, ID, required: true
          argument :include_hidden, Boolean, required: false
          def resolve(course_id:, include_hidden: nil)
            context[:canvas_api].proxy(
              "LIST_CUSTOM_GRADEBOOK_COLUMNS",
              {
                "course_id": course_id,
                "include_hidden": include_hidden              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end