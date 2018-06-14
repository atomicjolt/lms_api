require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizStatisticsLink < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
          field :quiz, String, "HTTP/HTTPS API URL to the quiz this statistics describe..Example: http://canvas.example.edu/api/v1/courses/1/quizzes/2", null: true

        end
      end
    end
  end
end