require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizGroup < BaseType
          description "Quiz Question Groups. API Docs: https://canvas.instructure.com/doc/api/quiz_question_groups.html"
          field :id, Int, "The ID of the question group..Example: 1", null: true
          field :quiz_id, Int, "The ID of the Quiz the question group belongs to..Example: 2", null: true
          field :name, String, "The name of the question group..Example: Fraction questions", null: true
          field :pick_count, Int, "The number of questions to pick from the group to display to the student..Example: 3", null: true
          field :question_points, Int, "The amount of points allotted to each question in the group..Example: 10", null: true
          field :assessment_question_bank_id, Int, "The ID of the Assessment question bank to pull questions from..Example: 2", null: true
          field :position, Int, "The order in which the question group will be retrieved and displayed..Example: 1", null: true

        end
      end
    end
  end
end