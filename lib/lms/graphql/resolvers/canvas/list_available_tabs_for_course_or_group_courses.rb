require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAvailableTabsForCourseOrGroupCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, include: nil)
            context[:canvas_api].proxy(
              "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_COURSES",
              {
                "course_id": course_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end