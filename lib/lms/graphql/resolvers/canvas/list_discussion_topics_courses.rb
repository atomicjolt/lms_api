require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/discussion_topic"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListDiscussionTopicsCourse < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::DiscussionTopic], null: false
          argument :course_id, String, required: true
          argument :include, String, required: false
          argument :order_by, String, required: false
          argument :scope, String, required: false
          argument :only_announcements, Boolean, required: false
          argument :filter_by, String, required: false
          argument :search_term, String, required: false
          argument :exclude_context_module_locked_topics, Boolean, required: false
          def resolve(course_id:, include: nil, order_by: nil, scope: nil, only_announcements: nil, filter_by: nil, search_term: nil, exclude_context_module_locked_topics: nil)
            context[:canvas_api].proxy(
              "LIST_DISCUSSION_TOPICS_COURSES",
              {
                "course_id": course_id,
                "include": include,
                "order_by": order_by,
                "scope": scope,
                "only_announcements": only_announcements,
                "filter_by": filter_by,
                "search_term": search_term,
                "exclude_context_module_locked_topics": exclude_context_module_locked_topics              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end