require_relative "../canvas_base_type"
require_relative "completion_requirement"
require_relative "content_detail"

module LMS
  module GraphQL
    module Types
      module Canvas
        class ModuleItemTypeEnum < ::GraphQL::Schema::Enum
          value "File"
          value "Page"
          value "Discussion"
          value "Assignment"
          value "Quiz"
          value "SubHeader"
          value "ExternalUrl"
          value "ExternalTool"
        end
        class ModuleItem < BaseType
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
          field :id, Int, "the unique identifier for the module item.Example: 768", null: true
          field :module_id, Int, "the id of the Module this item appears in.Example: 123", null: true
          field :position, Int, "the position of this item in the module (1-based).Example: 1", null: true
          field :title, String, "the title of this item.Example: Square Roots: Irrational numbers or boxy vegetables?", null: true
          field :indent, Int, "0-based indent level; module items may be indented to show a hierarchy.Example: 0", null: true
          field :type, ModuleItemTypeEnum, "the type of object referred to one of 'File', 'Page', 'Discussion', 'Assignment', 'Quiz', 'SubHeader', 'ExternalUrl', 'ExternalTool'.Example: Assignment", null: true
          field :content_id, Int, "the id of the object referred to applies to 'File', 'Discussion', 'Assignment', 'Quiz', 'ExternalTool' types.Example: 1337", null: true
          field :html_url, String, "link to the item in Canvas.Example: https://canvas.example.edu/courses/222/modules/items/768", null: true
          field :url, String, "(Optional) link to the Canvas API object, if applicable.Example: https://canvas.example.edu/api/v1/courses/222/assignments/987", null: true
          field :page_url, String, "(only for 'Page' type) unique locator for the linked wiki page.Example: my-page-title", null: true
          field :external_url, String, "(only for 'ExternalUrl' and 'ExternalTool' types) external url that the item points to.Example: https://www.example.com/externalurl", null: true
          field :new_tab, Boolean, "(only for 'ExternalTool' type) whether the external tool opens in a new tab.", null: true
          field :completion_requirement, LMS::GraphQL::Types::Canvas::CompletionRequirement, "Completion requirement for this module item.Example: min_score, 10, true", null: true
          field :content_details, LMS::GraphQL::Types::Canvas::ContentDetail, "(Present only if requested through include[]=content_details) If applicable, returns additional details specific to the associated object.Example: 20, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00", null: true
          field :published, Boolean, "(Optional) Whether this module item is published. This field is present only if the caller has permission to view unpublished items..Example: true", null: true

        end
      end
    end
  end
end