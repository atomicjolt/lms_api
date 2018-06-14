require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blueprint_migration"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class BeginMigrationToPushToAssociatedCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :template_id, String, required: true
          argument :comment, String, required: false
          argument :send_notification, Boolean, required: false
          argument :copy_settings, Boolean, required: false
          field :blueprint_migration, LMS::GraphQL::Types::Canvas::BlueprintMigration, null: false
          def resolve(course_id:, template_id:, comment: nil, send_notification: nil, copy_settings: nil)
            ctx[:canvas_api].proxy(
              "BEGIN_MIGRATION_TO_PUSH_TO_ASSOCIATED_COURSES",
              {
                "course_id": course_id,
                "template_id": template_id,
                "comment": comment,
                "send_notification": send_notification,
                "copy_settings": copy_settings              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end