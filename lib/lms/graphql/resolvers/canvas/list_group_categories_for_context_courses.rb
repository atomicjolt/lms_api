require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGroupCategoriesForContextCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::GroupCategory], null: false
          argument :course_id, String, required: true
          def resolve(course_id:)
            context[:canvas_api].proxy(
              "LIST_GROUP_CATEGORIES_FOR_CONTEXT_COURSES",
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