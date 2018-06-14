require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class SetOrRemoveRestrictionsOnBlueprintCourseObject < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :template_id, ID, required: true
          argument :content_type, String, required: false
          argument :content_id, ID, required: false
          argument :restricted, Boolean, required: false
          argument :restrictions, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, template_id:, content_type: nil, content_id: nil, restricted: nil, restrictions: nil)
            ctx[:canvas_api].proxy(
              "SET_OR_REMOVE_RESTRICTIONS_ON_BLUEPRINT_COURSE_OBJECT",
              {
                "course_id": course_id,
                "template_id": template_id,
                "content_type": content_type,
                "content_id": content_id,
                "restricted": restricted,
                "restrictions": restrictions              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end