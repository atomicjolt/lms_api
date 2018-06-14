require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class TurnitinSetting < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :originality_report_visibility, String, "Example: after_grading", null: true
          field :s_paper_check, Boolean, "", null: true
          field :internet_check, Boolean, "", null: true
          field :journal_check, Boolean, "", null: true
          field :exclude_biblio, Boolean, "", null: true
          field :exclude_quoted, Boolean, "", null: true
          field :exclude_small_matches_type, String, "Example: percent", null: true
          field :exclude_small_matches_value, Int, "Example: 50", null: true

        end
      end
    end
  end
end