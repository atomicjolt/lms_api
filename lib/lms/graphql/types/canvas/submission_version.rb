require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class SubmissionVersion < BaseType
          description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
          field :assignment_id, Int, "the id of the assignment this submissions is for.Example: 22604", null: true
          field :assignment_name, String, "the name of the assignment this submission is for.Example: some assignment", null: true
          field :body, String, "the body text of the submission.Example: text from the submission", null: true
          field :current_grade, String, "the most up to date grade for the current version of this submission.Example: 100", null: true
          field :current_graded_at, LMS::GraphQL::Types::DateTimeType, "the latest time stamp for the grading of this submission.Example: 2013-01-31T18:16:31Z", null: true
          field :current_grader, String, "the name of the most recent grader for this submission.Example: Grader Name", null: true
          field :grade_matches_current_submission, Boolean, "boolean indicating whether the grade is equal to the current submission grade.Example: true", null: true
          field :graded_at, LMS::GraphQL::Types::DateTimeType, "time stamp for the grading of this version of the submission.Example: 2013-01-31T18:16:31Z", null: true
          field :grader, String, "the name of the user who graded this version of the submission.Example: Grader Name", null: true
          field :grader_id, Int, "the user id of the user who graded this version of the submission.Example: 67379", null: true
          field :id, Int, "the id of the submission of which this is a version.Example: 11607", null: true
          field :new_grade, String, "the updated grade provided in this version of the submission.Example: 100", null: true
          field :new_graded_at, LMS::GraphQL::Types::DateTimeType, "the timestamp for the grading of this version of the submission (alias for graded_at).Example: 2013-01-31T18:16:31Z", null: true
          field :new_grader, String, "alias for 'grader'.Example: Grader Name", null: true
          field :previous_grade, String, "the grade for the submission version immediately preceding this one.Example: 90", null: true
          field :previous_graded_at, LMS::GraphQL::Types::DateTimeType, "the timestamp for the grading of the submission version immediately preceding this one.Example: 2013-01-29T12:12:12Z", null: true
          field :previous_grader, String, "the name of the grader who graded the version of this submission immediately preceding this one.Example: Graded on submission", null: true
          field :score, Int, "the score for this version of the submission.Example: 100", null: true
          field :user_name, String, "the name of the student who created this submission.Example: student@example.com", null: true
          field :submission_type, String, "the type of submission.Example: online", null: true
          field :url, String, "the url of the submission, if there is one.", null: true
          field :user_id, Int, "the user ID of the student who created this submission.Example: 67376", null: true
          field :workflow_state, String, "the state of the submission at this version.Example: unsubmitted", null: true

        end
      end
    end
  end
end