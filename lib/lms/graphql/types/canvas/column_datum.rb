require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ColumnDatum < BaseType
          description "Custom Gradebook Columns. API Docs: https://canvas.instructure.com/doc/api/custom_gradebook_columns.html"
          field :content, String, "Example: Nut allergy", null: true
          field :user_id, Int, "Example: 2", null: true

        end
      end
    end
  end
end