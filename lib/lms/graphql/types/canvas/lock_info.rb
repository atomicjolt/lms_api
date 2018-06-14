require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class LockInfo < BaseType
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
          field :asset_string, String, "Asset string for the object causing the lock.Example: assignment_4", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be unlocked. Must be before the due date..Example: 2013-01-01T00:00:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be locked. Must be after the due date..Example: 2013-02-01T00:00:00-06:00", null: true
          field :context_module, String, "(Optional) Context module causing the lock..Example: {}", null: true
          field :manually_locked, Boolean, "Example: true", null: true

        end
      end
    end
  end
end