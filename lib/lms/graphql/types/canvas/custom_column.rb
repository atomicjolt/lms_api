require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class CustomColumn < BaseType
          description "Custom Gradebook Columns. API Docs: https://canvas.instructure.com/doc/api/custom_gradebook_columns.html"
          field :id, Int, "The ID of the custom gradebook column.Example: 2", null: true
          field :teacher_notes, Boolean, "When true, this column's visibility will be toggled in the Gradebook when a user selects to show or hide notes.", null: true
          field :title, String, "header text.Example: Stuff", null: true
          field :position, Int, "column order.Example: 1", null: true
          field :hidden, Boolean, "won't be displayed if hidden is true.", null: true
          field :read_only, Boolean, "won't be editable in the gradebook UI.Example: true", null: true

        end
      end
    end
  end
end