require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizSubmission < BaseType
          description "Quiz Submissions. API Docs: https://canvas.instructure.com/doc/api/quiz_submissions.html"
          field :id, ID, "The ID of the quiz submission..Example: 1", null: true
          field :quiz_id, ID, "The ID of the Quiz the quiz submission belongs to..Example: 2", null: true
          field :user_id, ID, "The ID of the Student that made the quiz submission..Example: 3", null: true
          field :submission_id, ID, "The ID of the Submission the quiz submission represents..Example: 1", null: true
          field :started_at, String, "The time at which the student started the quiz submission..Example: 2013-11-07T13:16:18Z", null: true
          field :finished_at, String, "The time at which the student submitted the quiz submission..Example: 2013-11-07T13:16:18Z", null: true
          field :end_at, String, "The time at which the quiz submission will be overdue, and be flagged as a late submission..Example: 2013-11-07T13:16:18Z", null: true
          field :attempt, Int, "For quizzes that allow multiple attempts, this field specifies the quiz submission attempt number..Example: 3", null: true
          field :extra_attempts, Int, "Number of times the student was allowed to re-take the quiz over the multiple-attempt limit..Example: 1", null: true
          field :extra_time, Int, "Amount of extra time allowed for the quiz submission, in minutes..Example: 60", null: true
          field :manually_unlocked, Boolean, "The student can take the quiz even if it's locked for everyone else.Example: true", null: true
          field :time_spent, Int, "Amount of time spent, in seconds..Example: 300", null: true
          field :score, Int, "The score of the quiz submission, if graded..Example: 3", null: true
          field :score_before_regrade, Int, "The original score of the quiz submission prior to any re-grading..Example: 2", null: true
          field :kept_score, Int, "For quizzes that allow multiple attempts, this is the score that will be used, which might be the score of the latest, or the highest, quiz submission..Example: 5", null: true
          field :fudge_points, Int, "Number of points the quiz submission's score was fudged by..Example: 1", null: true
          field :has_seen_results, Boolean, "Whether the student has viewed their results to the quiz..Example: true", null: true
          field :workflow_state, String, "The current state of the quiz submission. Possible values: ['untaken'|'pending_review'|'complete'|'settings_only'|'preview']..Example: untaken", null: true
          field :overdue_and_needs_submission, Boolean, "Indicates whether the quiz submission is overdue and needs submission.Example: false", null: true

        end
      end
    end
  end
end