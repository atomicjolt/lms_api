require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListFavoriteCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Course], null: false
          argument :exclude_blueprint_courses, Boolean, required: false
          def resolve(exclude_blueprint_courses: nil)
            context[:canvas_api].proxy(
              "LIST_FAVORITE_COURSES",
              {
                "exclude_blueprint_courses": exclude_blueprint_courses              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end