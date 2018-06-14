require_relative "../canvas_base_type"
require_relative "file"
require_relative "progress"

module LMS
  module GraphQL
    module Types
      module Canvas
        class QuizReportReportTypeEnum < ::GraphQL::Schema::Enum
          value "student_analysis"
          value "item_analysis"
        end
        class QuizReport < BaseType
          description "Quiz Reports. API Docs: https://canvas.instructure.com/doc/api/quiz_reports.html"
          field :id, ID, "the ID of the quiz report.Example: 5", null: true
          field :quiz_id, ID, "the ID of the quiz.Example: 4", null: true
          field :report_type, QuizReportReportTypeEnum, "which type of report this is possible values: 'student_analysis', 'item_analysis'.Example: student_analysis", null: true
          field :readable_type, String, "a human-readable (and localized) version of the report_type.Example: Student Analysis", null: true
          field :includes_all_versions, Boolean, "boolean indicating whether the report represents all submissions or only the most recent ones for each student.Example: true", null: true
          field :anonymous, Boolean, "boolean indicating whether the report is for an anonymous survey. if true, no student names will be included in the csv.", null: true
          field :generatable, Boolean, "boolean indicating whether the report can be generated, which is true unless the quiz is a survey one.Example: true", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "when the report was created.Example: 2013-05-01T12:34:56-07:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "when the report was last updated.Example: 2013-05-01T12:34:56-07:00", null: true
          field :url, String, "the API endpoint for this report.Example: http://canvas.example.com/api/v1/courses/1/quizzes/1/reports/1", null: true
          field :file, LMS::GraphQL::Types::Canvas::File, "if the report has finished generating, a File object that represents it. refer to the Files API for more information about the format.", null: true
          field :progress_url, String, "if the report has not yet finished generating, a URL where information about its progress can be retrieved. refer to the Progress API for more information (Note: not available in JSON-API format).", null: true
          field :progress, LMS::GraphQL::Types::Canvas::Progress, "if the report is being generated, a Progress object that represents the operation. Refer to the Progress API for more information about the format. (Note: available only in JSON-API format).", null: true

        end
      end
    end
  end
end