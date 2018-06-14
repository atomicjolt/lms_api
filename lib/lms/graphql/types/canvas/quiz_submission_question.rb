require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizSubmissionQuestion < BaseType
          description "Quiz Submission Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_submission_questions.html"
          field :id, ID, "The ID of the QuizQuestion this answer is for..Example: 1", null: true
          field :flagged, Boolean, "Whether this question is flagged..Example: true", null: true
          field :answer, String, "The provided answer (if any) for this question. The format of this parameter depends on the type of the question, see the Appendix for more information..", null: true
          field :answers, String, "The possible answers for this question when those possible answers are necessary.  The presence of this parameter is dependent on permissions..", null: true

        end
      end
    end
  end
end