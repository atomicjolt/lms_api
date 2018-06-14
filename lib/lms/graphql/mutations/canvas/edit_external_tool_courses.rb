require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class EditExternalToolCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :external_tool_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(course_id:, external_tool_id:)
            ctx[:canvas_api].proxy(
              "EDIT_EXTERNAL_TOOL_COURSES",
              {
                "course_id": course_id,
                "external_tool_id": external_tool_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end