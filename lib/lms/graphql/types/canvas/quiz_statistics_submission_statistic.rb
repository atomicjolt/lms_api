require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizStatisticsSubmissionStatistic < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
          field :unique_count, Int, "The number of students who have taken the quiz..Example: 3", null: true
          field :score_average, Float, "The mean of the student submission scores..Example: 4.33333333333333", null: true
          field :score_high, Float, "The highest submission score..Example: 6", null: true
          field :score_low, Float, "The lowest submission score..Example: 3", null: true
          field :score_stdev, Float, "Standard deviation of the submission scores..Example: 1.24721912892465", null: true
          field :scores, String, "A percentile distribution of the student scores, each key is the percentile (ranges between 0 and 100%) while the value is the number of students who received that score..Example: 1, 5, 1", null: true
          field :correct_count_average, Float, "The mean of the number of questions answered correctly by each student..Example: 3.66666666666667", null: true
          field :incorrect_count_average, Float, "The mean of the number of questions answered incorrectly by each student..Example: 5", null: true
          field :duration_average, Float, "The average time spent by students while taking the quiz..Example: 42.333333333", null: true

        end
      end
    end
  end
end