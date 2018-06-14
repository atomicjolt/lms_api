require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/discussion_topic"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAnnouncement < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::DiscussionTopic], null: false
          argument :context_codes, String, required: true
          argument :start_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :end_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :active_only, Boolean, required: false
          argument :include, String, required: false
          def resolve(context_codes:, start_date: nil, end_date: nil, active_only: nil, include: nil)
            context[:canvas_api].proxy(
              "LIST_ANNOUNCEMENTS",
              {
                "context_codes": context_codes,
                "start_date": start_date,
                "end_date": end_date,
                "active_only": active_only,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end