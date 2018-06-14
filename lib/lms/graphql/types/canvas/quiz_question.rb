require_relative "../canvas_base_type"
require_relative "answer"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizQuestion < BaseType
          description "Quiz Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_questions.html"
          field :id, ID, "The ID of the quiz question..Example: 1", null: true
          field :quiz_id, ID, "The ID of the Quiz the question belongs to..Example: 2", null: true
          field :position, Int, "The order in which the question will be retrieved and displayed..Example: 1", null: true
          field :question_name, String, "The name of the question..Example: Prime Number Identification", null: true
          field :question_type, String, "The type of the question..Example: multiple_choice_question", null: true
          field :question_text, String, "The text of the question..Example: Which of the following is NOT a prime number?", null: true
          field :points_possible, Int, "The maximum amount of points possible received for getting this question correct..Example: 5", null: true
          field :correct_comments, String, "The comments to display if the student answers the question correctly..Example: That's correct!", null: true
          field :incorrect_comments, String, "The comments to display if the student answers incorrectly..Example: Unfortunately, that IS a prime number.", null: true
          field :neutral_comments, String, "The comments to display regardless of how the student answered..Example: Goldbach's conjecture proposes that every even integer greater than 2 can be expressed as the sum of two prime numbers.", null: true
          field :answers, [LMS::GraphQL::Types::Canvas::Answer], "An array of available answers to display to the student..", null: true

        end
      end
    end
  end
end