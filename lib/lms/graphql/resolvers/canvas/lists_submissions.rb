require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission_history"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListsSubmission < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::SubmissionHistory], null: false
          argument :course_id, Int, required: true
          argument :date, String, required: true
          argument :grader_id, Int, required: true
          argument :assignment_id, Int, required: true
          def resolve(course_id:, date:, grader_id:, assignment_id:)
            context[:canvas_api].proxy(
              "LISTS_SUBMISSIONS",
              {
                "course_id": course_id,
                "date": date,
                "grader_id": grader_id,
                "assignment_id": assignment_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end