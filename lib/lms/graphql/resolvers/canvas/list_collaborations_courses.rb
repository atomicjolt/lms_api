require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/collaboration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCollaborationsCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Collaboration], null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_COLLABORATIONS_COURSES",
              {
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end