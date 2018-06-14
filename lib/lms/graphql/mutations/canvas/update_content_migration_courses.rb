require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateContentMigrationCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          field :content_migration, LMS::GraphQL::Types::Canvas::ContentMigration, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "UPDATE_CONTENT_MIGRATION_COURSES",
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