require_relative "../canvas_base_type"
require_relative "quiz_statistics_answer_statistic"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizStatisticsQuestionStatistic < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
          field :responses, Int, "Number of students who have provided an answer to this question. Blank or empty responses are not counted..Example: 3", null: true
          field :answers, LMS::GraphQL::Types::Canvas::QuizStatisticsAnswerStatistic, "Statistics related to each individual pre-defined answer..", null: true

        end
      end
    end
  end
end