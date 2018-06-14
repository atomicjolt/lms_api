require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateQuiz < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :quiz_title, String, required: true
          argument :quiz_description, String, required: false
          argument :quiz_quiz_type, String, required: false
          argument :quiz_assignment_group_id, Int, required: false
          argument :quiz_time_limit, Int, required: false
          argument :quiz_shuffle_answers, Boolean, required: false
          argument :quiz_hide_results, String, required: false
          argument :quiz_show_correct_answers, Boolean, required: false
          argument :quiz_show_correct_answers_last_attempt, Boolean, required: false
          argument :quiz_show_correct_answers_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :quiz_hide_correct_answers_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :quiz_allowed_attempts, Int, required: false
          argument :quiz_scoring_policy, String, required: false
          argument :quiz_one_question_at_a_time, Boolean, required: false
          argument :quiz_cant_go_back, Boolean, required: false
          argument :quiz_access_code, String, required: false
          argument :quiz_ip_filter, String, required: false
          argument :quiz_due_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :quiz_lock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :quiz_unlock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :quiz_published, Boolean, required: false
          argument :quiz_one_time_results, Boolean, required: false
          argument :quiz_only_visible_to_overrides, Boolean, required: false
          field :quiz, LMS::GraphQL::Types::Canvas::Quiz, null: false
          def resolve(course_id:, quiz_title:, quiz_description: nil, quiz_quiz_type: nil, quiz_assignment_group_id: nil, quiz_time_limit: nil, quiz_shuffle_answers: nil, quiz_hide_results: nil, quiz_show_correct_answers: nil, quiz_show_correct_answers_last_attempt: nil, quiz_show_correct_answers_at: nil, quiz_hide_correct_answers_at: nil, quiz_allowed_attempts: nil, quiz_scoring_policy: nil, quiz_one_question_at_a_time: nil, quiz_cant_go_back: nil, quiz_access_code: nil, quiz_ip_filter: nil, quiz_due_at: nil, quiz_lock_at: nil, quiz_unlock_at: nil, quiz_published: nil, quiz_one_time_results: nil, quiz_only_visible_to_overrides: nil)
            ctx[:canvas_api].proxy(
              "CREATE_QUIZ",
              {
                "course_id": course_id,
                "quiz[title]": quiz_title,
                "quiz[description]": quiz_description,
                "quiz[quiz_type]": quiz_quiz_type,
                "quiz[assignment_group_id]": quiz_assignment_group_id,
                "quiz[time_limit]": quiz_time_limit,
                "quiz[shuffle_answers]": quiz_shuffle_answers,
                "quiz[hide_results]": quiz_hide_results,
                "quiz[show_correct_answers]": quiz_show_correct_answers,
                "quiz[show_correct_answers_last_attempt]": quiz_show_correct_answers_last_attempt,
                "quiz[show_correct_answers_at]": quiz_show_correct_answers_at,
                "quiz[hide_correct_answers_at]": quiz_hide_correct_answers_at,
                "quiz[allowed_attempts]": quiz_allowed_attempts,
                "quiz[scoring_policy]": quiz_scoring_policy,
                "quiz[one_question_at_a_time]": quiz_one_question_at_a_time,
                "quiz[cant_go_back]": quiz_cant_go_back,
                "quiz[access_code]": quiz_access_code,
                "quiz[ip_filter]": quiz_ip_filter,
                "quiz[due_at]": quiz_due_at,
                "quiz[lock_at]": quiz_lock_at,
                "quiz[unlock_at]": quiz_unlock_at,
                "quiz[published]": quiz_published,
                "quiz[one_time_results]": quiz_one_time_results,
                "quiz[only_visible_to_overrides]": quiz_only_visible_to_overrides              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end