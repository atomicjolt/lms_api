require_relative "../canvas_base_type"
require_relative "quiz_statistics_question_statistic"
require_relative "quiz_statistics_submission_statistic"
require_relative "quiz_statistics_link"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizStatistic < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
          field :id, ID, "The ID of the quiz statistics report..Example: 1", null: true
          field :quiz_id, ID, "The ID of the Quiz the statistics report is for. 
NOTE: AVAILABLE ONLY IN NON-JSON-API REQUESTS..Example: 2", null: true
          field :multiple_attempts_exist, Boolean, "Whether there are any students that have made mutliple submissions for this quiz..Example: true", null: true
          field :includes_all_versions, Boolean, "In the presence of multiple attempts, this field describes whether the statistics describe all the submission attempts and not only the latest ones..Example: true", null: true
          field :generated_at, LMS::GraphQL::Types::DateTimeType, "The time at which the statistics were generated, which is usually after the occurrence of a quiz event, like a student submitting it..Example: 2013-01-23T23:59:00-07:00", null: true
          field :url, String, "The API HTTP/HTTPS URL to this quiz statistics..Example: http://canvas.example.edu/api/v1/courses/1/quizzes/2/statistics", null: true
          field :html_url, String, "The HTTP/HTTPS URL to the page where the statistics can be seen visually..Example: http://canvas.example.edu/courses/1/quizzes/2/statistics", null: true
          field :question_statistics, LMS::GraphQL::Types::Canvas::QuizStatisticsQuestionStatistic, "Question-specific statistics for each question and its answers..", null: true
          field :submission_statistics, LMS::GraphQL::Types::Canvas::QuizStatisticsSubmissionStatistic, "Question-specific statistics for each question and its answers..", null: true
          field :links, LMS::GraphQL::Types::Canvas::QuizStatisticsLink, "JSON-API construct that contains links to media related to this quiz statistics object. 
NOTE: AVAILABLE ONLY IN JSON-API REQUESTS..", null: true

        end
      end
    end
  end
end