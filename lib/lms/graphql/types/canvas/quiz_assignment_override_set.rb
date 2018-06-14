require_relative "../canvas_base_type"
require_relative "quiz_assignment_override"
require_relative "quiz_assignment_override"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizAssignmentOverrideSet < BaseType
          description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
          field :quiz_id, String, "ID of the quiz those dates are for..Example: 1", null: true
          field :due_dates, LMS::GraphQL::Types::Canvas::QuizAssignmentOverride, "An array of quiz assignment overrides. For students, this array will always contain a single item which is the set of dates that apply to that student. For teachers and staff, it may contain more..", null: true
          field :all_dates, LMS::GraphQL::Types::Canvas::QuizAssignmentOverride, "An array of all assignment overrides active for the quiz. This is visible only to teachers and staff..", null: true

        end
      end
    end
  end
end