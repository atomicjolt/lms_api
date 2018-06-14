require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizStatisticsAnswerPointBiserial < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
          field :answer_id, Int, "ID of the answer the point biserial is for..Example: 3866", null: true
          field :point_biserial, Float, "The point biserial value for this answer. Value ranges between -1 and 1..Example: -0.802955068546966", null: true
          field :correct, Boolean, "Convenience attribute that denotes whether this is the correct answer as opposed to being a distractor. This is mutually exclusive with the `distractor` value.Example: true", null: true
          field :distractor, Boolean, "Convenience attribute that denotes whether this is a distractor answer and not the correct one. This is mutually exclusive with the `correct` value.", null: true

        end
      end
    end
  end
end