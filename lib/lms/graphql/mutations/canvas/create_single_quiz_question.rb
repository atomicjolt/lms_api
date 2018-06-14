require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz_question"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateSingleQuizQuestion < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :question_question_name, String, required: false
          argument :question_question_text, String, required: false
          argument :question_quiz_group_id, Int, required: false
          argument :question_question_type, String, required: false
          argument :question_position, Int, required: false
          argument :question_points_possible, Int, required: false
          argument :question_correct_comments, String, required: false
          argument :question_incorrect_comments, String, required: false
          argument :question_neutral_comments, String, required: false
          argument :question_text_after_answers, String, required: false
          argument :question_answers, String, required: false
          field :quiz_question, LMS::GraphQL::Types::Canvas::QuizQuestion, null: false
          def resolve(course_id:, quiz_id:, question_question_name: nil, question_question_text: nil, question_quiz_group_id: nil, question_question_type: nil, question_position: nil, question_points_possible: nil, question_correct_comments: nil, question_incorrect_comments: nil, question_neutral_comments: nil, question_text_after_answers: nil, question_answers: nil)
            ctx[:canvas_api].proxy(
              "CREATE_SINGLE_QUIZ_QUESTION",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "question[question_name]": question_question_name,
                "question[question_text]": question_question_text,
                "question[quiz_group_id]": question_quiz_group_id,
                "question[question_type]": question_question_type,
                "question[position]": question_position,
                "question[points_possible]": question_points_possible,
                "question[correct_comments]": question_correct_comments,
                "question[incorrect_comments]": question_incorrect_comments,
                "question[neutral_comments]": question_neutral_comments,
                "question[text_after_answers]": question_text_after_answers,
                "question[answers]": question_answers              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end