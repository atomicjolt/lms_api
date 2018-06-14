require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAssignmentSubmissionsCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Submission], null: false
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :include, String, required: false
          argument :grouped, Boolean, required: false
          def resolve(course_id:, assignment_id:, include: nil, grouped: nil)
            context[:canvas_api].proxy(
              "LIST_ASSIGNMENT_SUBMISSIONS_COURSES",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "include": include,
                "grouped": grouped              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end