require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class GradingPeriod < BaseType
          description "Grading Periods. API Docs: https://canvas.instructure.com/doc/api/grading_periods.html"
          field :id, Int, "The unique identifier for the grading period..Example: 1023", null: true
          field :title, String, "The title for the grading period..Example: First Block", null: true
          field :start_date, String, "The start date of the grading period..Example: 2014-01-07T15:04:00Z", null: true
          field :end_date, String, "The end date of the grading period..Example: 2014-05-07T17:07:00Z", null: true
          field :close_date, String, "Grades can only be changed before the close date of the grading period..Example: 2014-06-07T17:07:00Z", null: true
          field :weight, Int, "A weight value that contributes to the overall weight of a grading period set which is used to calculate how much assignments in this period contribute to the total grade.Example: 33.33", null: true
          field :is_closed, Boolean, "If true, the grading period's close_date has passed..Example: true", null: true

        end
      end
    end
  end
end