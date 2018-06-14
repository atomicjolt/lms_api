require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Answer < BaseType
          description "Quiz Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_questions.html"
          field :id, ID, "The unique identifier for the answer.  Do not supply if this answer is part of a new question.Example: 6656", null: true
          field :answer_text, String, "The text of the answer..Example: Constantinople", null: true
          field :answer_weight, Int, "An integer to determine correctness of the answer. Incorrect answers should be 0, correct answers should be non-negative..Example: 100", null: true
          field :answer_comments, String, "Specific contextual comments for a particular answer..Example: Remember to check your spelling prior to submitting this answer.", null: true
          field :text_after_answers, String, "Used in missing word questions.  The text to follow the missing word.Example:  is the capital of Utah.", null: true
          field :answer_match_left, String, "Used in matching questions.  The static value of the answer that will be displayed on the left for students to match for..Example: Salt Lake City", null: true
          field :answer_match_right, String, "Used in matching questions. The correct match for the value given in answer_match_left.  Will be displayed in a dropdown with the other answer_match_right values...Example: Utah", null: true
          field :matching_answer_incorrect_matches, String, "Used in matching questions. A list of distractors, delimited by new lines (
) that will be seeded with all the answer_match_right values..Example: Nevada California Washington", null: true
          field :numerical_answer_type, String, "Used in numerical questions.  Values can be 'exact_answer', 'range_answer', or 'precision_answer'..Example: exact_answer", null: true
          field :exact, Int, "Used in numerical questions of type 'exact_answer'.  The value the answer should equal..Example: 42", null: true
          field :margin, Int, "Used in numerical questions of type 'exact_answer'. The margin of error allowed for the student's answer..Example: 4", null: true
          field :approximate, Float, "Used in numerical questions of type 'precision_answer'.  The value the answer should equal..Example: 1234600000.0", null: true
          field :precision, Int, "Used in numerical questions of type 'precision_answer'. The numerical precision that will be used when comparing the student's answer..Example: 4", null: true
          field :start, Int, "Used in numerical questions of type 'range_answer'. The start of the allowed range (inclusive)..Example: 1", null: true
          field :end, Int, "Used in numerical questions of type 'range_answer'. The end of the allowed range (inclusive)..Example: 10", null: true
          field :blank_id, ID, "Used in fill in multiple blank and multiple dropdowns questions..Example: 1170", null: true

        end
      end
    end
  end
end