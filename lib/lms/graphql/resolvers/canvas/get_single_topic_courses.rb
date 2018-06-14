require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleTopicCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :topic_id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, topic_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_TOPIC_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end