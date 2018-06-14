require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ProvisionalGrade < BaseType
          description "Moderated Grading. API Docs: https://canvas.instructure.com/doc/api/moderated_grading.html"
          field :provisional_grade_id, ID, "The identifier for the provisional grade.Example: 23", null: true
          field :score, Int, "The numeric score.Example: 90", null: true
          field :grade, String, "The grade.Example: A-", null: true
          field :grade_matches_current_submission, Boolean, "Whether the grade was applied to the most current submission (false if the student resubmitted after grading).Example: true", null: true
          field :graded_at, LMS::GraphQL::Types::DateTimeType, "When the grade was given.Example: 2015-11-01T00:03:21-06:00", null: true
          field :final, Boolean, "Whether this is the 'final' provisional grade created by the moderator.", null: true
          field :speedgrader_url, String, "A link to view this provisional grade in SpeedGrader™.Example: http://www.example.com/courses/123/gradebook/speed_grader?.", null: true

        end
      end
    end
  end
end