require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz_report"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateQuizReport < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :quiz_id, String, required: true
          argument :quiz_report_report_type, String, required: true
          argument :quiz_report_includes_all_versions, Boolean, required: false
          argument :include, String, required: false
          field :quiz_report, LMS::GraphQL::Types::Canvas::QuizReport, null: false
          def resolve(course_id:, quiz_id:, quiz_report_report_type:, quiz_report_includes_all_versions: nil, include: nil)
            ctx[:canvas_api].proxy(
              "CREATE_QUIZ_REPORT",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "quiz_report[report_type]": quiz_report_report_type,
                "quiz_report[includes_all_versions]": quiz_report_includes_all_versions,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end