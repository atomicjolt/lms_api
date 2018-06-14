require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module_item"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateModuleItem < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :module_id, ID, required: true
          argument :id, ID, required: true
          argument :module_item_title, String, required: false
          argument :module_item_position, Int, required: false
          argument :module_item_indent, Int, required: false
          argument :module_item_external_url, String, required: false
          argument :module_item_new_tab, Boolean, required: false
          argument :module_item_completion_requirement_type, String, required: false
          argument :module_item_completion_requirement_min_score, Int, required: false
          argument :module_item_published, Boolean, required: false
          argument :module_item_module_id, String, required: false
          field :module_item, LMS::GraphQL::Types::Canvas::ModuleItem, null: false
          def resolve(course_id:, module_id:, id:, module_item_title: nil, module_item_position: nil, module_item_indent: nil, module_item_external_url: nil, module_item_new_tab: nil, module_item_completion_requirement_type: nil, module_item_completion_requirement_min_score: nil, module_item_published: nil, module_item_module_id: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_MODULE_ITEM",
              {
                "course_id": course_id,
                "module_id": module_id,
                "id": id,
                "module_item[title]": module_item_title,
                "module_item[position]": module_item_position,
                "module_item[indent]": module_item_indent,
                "module_item[external_url]": module_item_external_url,
                "module_item[new_tab]": module_item_new_tab,
                "module_item[completion_requirement][type]": module_item_completion_requirement_type,
                "module_item[completion_requirement][min_score]": module_item_completion_requirement_min_score,
                "module_item[published]": module_item_published,
                "module_item[module_id]": module_item_module_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end