require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission_version"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUncollatedSubmissionVersion < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::SubmissionVersion], null: false
          argument :course_id, Int, required: true
          argument :assignment_id, Int, required: false
          argument :user_id, Int, required: false
          argument :ascending, Boolean, required: false
          def resolve(course_id:, assignment_id: nil, user_id: nil, ascending: nil)
            context[:canvas_api].proxy(
              "LIST_UNCOLLATED_SUBMISSION_VERSIONS",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "user_id": user_id,
                "ascending": ascending              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end