require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListYourCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Course], null: false
          argument :enrollment_type, String, required: false
          argument :enrollment_role, String, required: false
          argument :enrollment_role_id, Int, required: false
          argument :enrollment_state, String, required: false
          argument :exclude_blueprint_courses, Boolean, required: false
          argument :include, String, required: false
          argument :state, String, required: false
          def resolve(enrollment_type: nil, enrollment_role: nil, enrollment_role_id: nil, enrollment_state: nil, exclude_blueprint_courses: nil, include: nil, state: nil)
            context[:canvas_api].proxy(
              "LIST_YOUR_COURSES",
              {
                "enrollment_type": enrollment_type,
                "enrollment_role": enrollment_role,
                "enrollment_role_id": enrollment_role_id,
                "enrollment_state": enrollment_state,
                "exclude_blueprint_courses": exclude_blueprint_courses,
                "include": include,
                "state": state              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end