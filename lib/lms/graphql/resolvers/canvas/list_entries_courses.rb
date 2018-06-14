require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEntriesCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, String, required: true
          argument :topic_id, String, required: true
          argument :ids, String, required: false
          def resolve(course_id:, topic_id:, ids: nil)
            context[:canvas_api].proxy(
              "LIST_ENTRIES_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id,
                "ids": ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end