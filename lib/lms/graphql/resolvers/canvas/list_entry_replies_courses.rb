require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListEntryRepliesCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :entry_id, ID, required: true
          def resolve(course_id:, topic_id:, entry_id:)
            context[:canvas_api].proxy(
              "LIST_ENTRY_REPLIES_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id,
                "entry_id": entry_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end