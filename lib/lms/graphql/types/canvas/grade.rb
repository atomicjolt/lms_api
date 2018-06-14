require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Grade < BaseType
          description "Enrollments. API Docs: https://canvas.instructure.com/doc/api/enrollments.html"
          field :html_url, String, "The URL to the Canvas web UI page for the user's grades, if this is a student enrollment..", null: true
          field :current_grade, String, "The user's current grade in the class. Only included if user has permissions to view this grade..", null: true
          field :final_grade, String, "The user's final grade for the class. Only included if user has permissions to view this grade..", null: true
          field :current_score, String, "The user's current score in the class. Only included if user has permissions to view this score..", null: true
          field :final_score, String, "The user's final score for the class. Only included if user has permissions to view this score..", null: true
          field :unposted_current_grade, String, "The user's current grade in the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins..", null: true
          field :unposted_final_grade, String, "The user's final grade for the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins...", null: true
          field :unposted_current_score, String, "The user's current score in the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", null: true
          field :unposted_final_score, String, "The user's final score for the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", null: true

        end
      end
    end
  end
end