require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListExternalToolsCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :search_term, String, required: false
          argument :selectable, Boolean, required: false
          argument :include_parents, Boolean, required: false
          def resolve(course_id:, search_term: nil, selectable: nil, include_parents: nil)
            context[:canvas_api].proxy(
              "LIST_EXTERNAL_TOOLS_COURSES",
              {
                "course_id": course_id,
                "search_term": search_term,
                "selectable": selectable,
                "include_parents": include_parents              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end