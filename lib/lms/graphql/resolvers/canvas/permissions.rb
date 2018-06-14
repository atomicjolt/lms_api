require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class Permission < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :permissions, String, required: false
          def resolve(course_id:, permissions: nil)
            context[:canvas_api].proxy(
              "PERMISSIONS",
              {
                "course_id": course_id,
                "permissions": permissions              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end