require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/column_datum"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEntriesForColumn < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::ColumnDatum], null: false
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :include_hidden, Boolean, required: false
          def resolve(course_id:, id:, include_hidden: nil)
            context[:canvas_api].proxy(
              "LIST_ENTRIES_FOR_COLUMN",
              {
                "course_id": course_id,
                "id": id,
                "include_hidden": include_hidden              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end