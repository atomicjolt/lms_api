require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/module_item"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListModuleItem < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::ModuleItem], null: false
          argument :course_id, ID, required: true
          argument :module_id, ID, required: true
          argument :include, String, required: false
          argument :search_term, String, required: false
          argument :student_id, ID, required: false
          def resolve(course_id:, module_id:, include: nil, search_term: nil, student_id: nil)
            context[:canvas_api].proxy(
              "LIST_MODULE_ITEMS",
              {
                "course_id": course_id,
                "module_id": module_id,
                "include": include,
                "search_term": search_term,
                "student_id": student_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end