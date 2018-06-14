require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ResolvePathCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Folder], null: false
          argument :course_id, ID, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "RESOLVE_PATH_COURSES",
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