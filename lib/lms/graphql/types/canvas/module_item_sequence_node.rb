require_relative "../canvas_base_type"
require_relative "module_item"
require_relative "module_item"
require_relative "module_item"

module LMS
  module GraphQL
    module Types
      module Canvas
        class ModuleItemSequenceNode < BaseType
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
          field :prev, LMS::GraphQL::Types::Canvas::ModuleItem, "The previous ModuleItem in the sequence.", null: true
          field :current, LMS::GraphQL::Types::Canvas::ModuleItem, "The ModuleItem being queried.Example: 768, 123, A lonely page, Page", null: true
          field :next, LMS::GraphQL::Types::Canvas::ModuleItem, "The next ModuleItem in the sequence.Example: 769, 127, Project 1, Assignment", null: true
          field :mastery_path, String, "The conditional release rule for the module item, if applicable.Example: true, , , false, false, /courses/11/modules, /courses/11/modules/items/9/choose, false", null: true

        end
      end
    end
  end
end