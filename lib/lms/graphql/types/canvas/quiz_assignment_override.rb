require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizAssignmentOverride < BaseType
          description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
          field :id, Int, "ID of the assignment override, unless this is the base construct, in which case the 'id' field is omitted..Example: 1", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "The date after which any quiz submission is considered late..Example: 2014-02-21T06:59:59Z", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "Date when the quiz becomes available for taking..", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "When the quiz will stop being available for taking. A value of null means it can always be taken..Example: 2014-02-21T06:59:59Z", null: true
          field :title, String, "Title of the section this assignment override is for, if any..Example: Project X", null: true
          field :base, Boolean, "If this property is present, it means that dates in this structure are not based on an assignment override, but are instead for all students..Example: true", null: true

        end
      end
    end
  end
end