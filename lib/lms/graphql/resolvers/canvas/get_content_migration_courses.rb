require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetContentMigrationCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "GET_CONTENT_MIGRATION_COURSES",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end