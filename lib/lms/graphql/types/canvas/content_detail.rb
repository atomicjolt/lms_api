require_relative "../canvas_base_type"
require_relative "lock_info"

module LMS
  module GraphQL
    module Types
      module Canvas
        class ContentDetail < BaseType
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
          field :points_possible, Int, "Example: 20", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-12-31T06:00:00-06:00", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-12-31T06:00:00-06:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "Example: 2012-12-31T06:00:00-06:00", null: true
          field :locked_for_user, Boolean, "Example: true", null: true
          field :lock_explanation, String, "Example: This quiz is part of an unpublished module and is not available yet.", null: true
          field :lock_info, LMS::GraphQL::Types::Canvas::LockInfo, "Example: assignment_4, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00, {}", null: true

        end
      end
    end
  end
end