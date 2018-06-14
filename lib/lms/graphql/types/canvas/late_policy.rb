require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class LatePolicy < BaseType
          description "Late Policy. API Docs: https://canvas.instructure.com/doc/api/late_policy.html"
          field :id, Int, "the unique identifier for the late policy.Example: 123", null: true
          field :course_id, Int, "the unique identifier for the course.Example: 123", null: true
          field :missing_submission_deduction_enabled, Boolean, "whether to enable missing submission deductions.Example: true", null: true
          field :missing_submission_deduction, Float, "amount of percentage points to deduct.Example: 12.34", null: true
          field :late_submission_deduction_enabled, Boolean, "whether to enable late submission deductions.Example: true", null: true
          field :late_submission_deduction, Float, "amount of percentage points to deduct per late_submission_interval.Example: 12.34", null: true
          field :late_submission_interval, String, "time interval for late submission deduction.Example: hour", null: true
          field :late_submission_minimum_percent_enabled, Boolean, "whether to enable late submission minimum percent.Example: true", null: true
          field :late_submission_minimum_percent, Float, "the minimum score a submission can receive in percentage points.Example: 12.34", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "the time at which this late policy was originally created.Example: 2012-07-01T23:59:00-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "the time at which this late policy was last modified in any way.Example: 2012-07-01T23:59:00-06:00", null: true

        end
      end
    end
  end
end