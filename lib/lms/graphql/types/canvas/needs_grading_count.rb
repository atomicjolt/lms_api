require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class NeedsGradingCount < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :section_id, ID, "The section ID.Example: 123456", null: true
          field :needs_grading_count, Int, "Number of submissions that need grading.Example: 5", null: true

        end
      end
    end
  end
end