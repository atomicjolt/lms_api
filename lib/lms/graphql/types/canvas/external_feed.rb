require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ExternalFeedVerbosityEnum < ::GraphQL::Schema::Enum
          value "link_only"
          value "truncate"
          value "full"
        end
        class ExternalFeed < BaseType
          description "Announcement External Feeds. API Docs: https://canvas.instructure.com/doc/api/announcement_external_feeds.html"
          field :id, Int, "The ID of the feed.Example: 5", null: true
          field :display_name, String, "The title of the feed, pulled from the feed itself. If the feed hasn't yet been pulled, a temporary name will be synthesized based on the URL.Example: My Blog", null: true
          field :url, String, "The HTTP/HTTPS URL to the feed.Example: http://example.com/myblog.rss", null: true
          field :header_match, String, "If not null, only feed entries whose title contains this string will trigger new posts in Canvas.Example: pattern", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "When this external feed was added to Canvas.Example: 2012-06-01T00:00:00-06:00", null: true
          field :verbosity, ExternalFeedVerbosityEnum, "The verbosity setting determines how much of the feed's content is imported into Canvas as part of the posting. 'link_only' means that only the title and a link to the item. 'truncate' means that a summary of the first portion of the item body will be used. 'full' means that the full item body will be used..Example: truncate", null: true

        end
      end
    end
  end
end