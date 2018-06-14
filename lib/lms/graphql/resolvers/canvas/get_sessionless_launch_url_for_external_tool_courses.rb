require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSessionlessLaunchUrlForExternalToolCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :id, String, required: false
          argument :url, String, required: false
          argument :assignment_id, String, required: false
          argument :module_item_id, String, required: false
          argument :launch_type, String, required: false
          def resolve(course_id:, id: nil, url: nil, assignment_id: nil, module_item_id: nil, launch_type: nil)
            context[:canvas_api].proxy(
              "GET_SESSIONLESS_LAUNCH_URL_FOR_EXTERNAL_TOOL_COURSES",
              {
                "course_id": course_id,
                "id": id,
                "url": url,
                "assignment_id": assignment_id,
                "module_item_id": module_item_id,
                "launch_type": launch_type              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end