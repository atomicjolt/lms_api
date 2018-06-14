require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class AssignmentDate < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :id, Int, "(Optional, missing if 'base' is present) id of the assignment override this date represents.Example: 1", null: true
          field :base, Boolean, "(Optional, present if 'id' is missing) whether this date represents the assignment's or quiz's default due date.Example: true", null: true
          field :title, String, "Example: Summer Session", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "The due date for the assignment. Must be between the unlock date and the lock date if there are lock dates.Example: 2013-08-28T23:59:00-06:00", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "The unlock date for the assignment. Must be before the due date if there is a due date..Example: 2013-08-01T00:00:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "The lock date for the assignment. Must be after the due date if there is a due date..Example: 2013-08-31T23:59:00-06:00", null: true

        end
      end
    end
  end
end