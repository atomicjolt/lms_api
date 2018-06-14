require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Tab < BaseType
          description "Tabs. API Docs: https://canvas.instructure.com/doc/api/tabs.html"
          field :html_url, String, "Example: /courses/1/external_tools/4", null: true
          field :id, String, "Example: context_external_tool_4", null: true
          field :label, String, "Example: WordPress", null: true
          field :type, String, "Example: external", null: true
          field :hidden, Boolean, "only included if true.Example: true", null: true
          field :visibility, String, "possible values are: public, members, admins, and none.Example: public", null: true
          field :position, Int, "1 based.Example: 2", null: true

        end
      end
    end
  end
end