require_relative "../canvas_base_type"
require_relative "lock_info"
require_relative "quiz_permission"
require_relative "assignment_date"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizQuizTypeEnum < ::GraphQL::Schema::Enum
          value "practice_quiz"
          value "assignment"
          value "graded_survey"
          value "survey"
        end

                class QuizHideResultEnum < ::GraphQL::Schema::Enum
          value "always"
          value "until_after_last_attempt"
        end

                class QuizScoringPolicyEnum < ::GraphQL::Schema::Enum
          value "keep_highest"
          value "keep_latest"
        end
        class Quiz < BaseType
          description "Quizzes. API Docs: https://canvas.instructure.com/doc/api/quizzes.html"
          field :id, Int, "the ID of the quiz.Example: 5", null: true
          field :title, String, "the title of the quiz.Example: Hamlet Act 3 Quiz", null: true
          field :html_url, String, "the HTTP/HTTPS URL to the quiz.Example: http://canvas.example.edu/courses/1/quizzes/2", null: true
          field :mobile_url, String, "a url suitable for loading the quiz in a mobile webview.  it will persiste the headless session and, for quizzes in public courses, will force the user to login.Example: http://canvas.example.edu/courses/1/quizzes/2?persist_healdess=1&force_user=1", null: true
          field :preview_url, String, "A url that can be visited in the browser with a POST request to preview a quiz as the teacher. Only present when the user may grade.Example: http://canvas.example.edu/courses/1/quizzes/2/take?preview=1", null: true
          field :description, String, "the description of the quiz.Example: This is a quiz on Act 3 of Hamlet", null: true
          field :quiz_type, QuizQuizTypeEnum, "type of quiz possible values: 'practice_quiz', 'assignment', 'graded_survey', 'survey'.Example: assignment", null: true
          field :assignment_group_id, Int, "the ID of the quiz's assignment group:.Example: 3", null: true
          field :time_limit, Int, "quiz time limit in minutes.Example: 5", null: true
          field :shuffle_answers, Boolean, "shuffle answers for students?.", null: true
          field :hide_results, QuizHideResultEnum, "let students see their quiz responses? possible values: null, 'always', 'until_after_last_attempt'.Example: always", null: true
          field :show_correct_answers, Boolean, "show which answers were correct when results are shown? only valid if hide_results=null.Example: true", null: true
          field :show_correct_answers_last_attempt, Boolean, "restrict the show_correct_answers option above to apply only to the last submitted attempt of a quiz that allows multiple attempts. only valid if show_correct_answers=true and allowed_attempts > 1.Example: true", null: true
          field :show_correct_answers_at, LMS::GraphQL::Types::DateTimeType, "when should the correct answers be visible by students? only valid if show_correct_answers=true.Example: 2013-01-23T23:59:00-07:00", null: true
          field :hide_correct_answers_at, LMS::GraphQL::Types::DateTimeType, "prevent the students from seeing correct answers after the specified date has passed. only valid if show_correct_answers=true.Example: 2013-01-23T23:59:00-07:00", null: true
          field :one_time_results, Boolean, "prevent the students from seeing their results more than once (right after they submit the quiz).Example: true", null: true
          field :scoring_policy, QuizScoringPolicyEnum, "which quiz score to keep (only if allowed_attempts != 1) possible values: 'keep_highest', 'keep_latest'.Example: keep_highest", null: true
          field :allowed_attempts, Int, "how many times a student can take the quiz -1 = unlimited attempts.Example: 3", null: true
          field :one_question_at_a_time, Boolean, "show one question at a time?.", null: true
          field :question_count, Int, "the number of questions in the quiz.Example: 12", null: true
          field :points_possible, Int, "The total point value given to the quiz.Example: 20", null: true
          field :cant_go_back, Boolean, "lock questions after answering? only valid if one_question_at_a_time=true.", null: true
          field :access_code, String, "access code to restrict quiz access.Example: 2beornot2be", null: true
          field :ip_filter, String, "IP address or range that quiz access is limited to.Example: 123.123.123.123", null: true
          field :due_at, LMS::GraphQL::Types::DateTimeType, "when the quiz is due.Example: 2013-01-23T23:59:00-07:00", null: true
          field :lock_at, LMS::GraphQL::Types::DateTimeType, "when to lock the quiz.", null: true
          field :unlock_at, LMS::GraphQL::Types::DateTimeType, "when to unlock the quiz.Example: 2013-01-21T23:59:00-07:00", null: true
          field :published, Boolean, "whether the quiz has a published or unpublished draft state..Example: true", null: true
          field :unpublishable, Boolean, "Whether the assignment's 'published' state can be changed to false. Will be false if there are student submissions for the quiz..Example: true", null: true
          field :locked_for_user, Boolean, "Whether or not this is locked for the user..", null: true
          field :lock_info, LMS::GraphQL::Types::Canvas::LockInfo, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", null: true
          field :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This quiz is locked until September 1 at 12:00am", null: true
          field :speedgrader_url, String, "Link to Speed Grader for this quiz. Will not be present if quiz is unpublished.Example: http://canvas.instructure.com/courses/1/speed_grader?assignment_id=1", null: true
          field :quiz_extensions_url, String, "Link to endpoint to send extensions for this quiz..Example: http://canvas.instructure.com/courses/1/quizzes/2/quiz_extensions", null: true
          field :permissions, LMS::GraphQL::Types::Canvas::QuizPermission, "Permissions the user has for the quiz.", null: true
          field :all_dates, [LMS::GraphQL::Types::Canvas::AssignmentDate], "list of due dates for the quiz.", null: true
          field :version_number, Int, "Current version number of the quiz.Example: 3", null: true
          field :question_types, String, "List of question types in the quiz.Example: multiple_choice, essay", null: true
          field :anonymous_submissions, Boolean, "Whether survey submissions will be kept anonymous (only applicable to 'graded_survey', 'survey' quiz types).", null: true

        end
      end
    end
  end
end