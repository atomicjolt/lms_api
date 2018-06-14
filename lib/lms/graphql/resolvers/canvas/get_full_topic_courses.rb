require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFullTopicCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :topic_id, ID, required: true
          def resolve(course_id:, topic_id:)
            context[:canvas_api].proxy(
              "GET_FULL_TOPIC_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end