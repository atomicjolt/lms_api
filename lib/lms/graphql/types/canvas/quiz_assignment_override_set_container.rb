require_relative "../canvas_base_type"
require_relative "quiz_assignment_override_set"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizAssignmentOverrideSetContainer < BaseType
          description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
          field :quiz_assignment_overrides, [LMS::GraphQL::Types::Canvas::QuizAssignmentOverrideSet], "The QuizAssignmentOverrideSet.", null: true

        end
      end
    end
  end
end