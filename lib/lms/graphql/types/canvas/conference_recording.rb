require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class ConferenceRecording < BaseType
          description "Conferences. API Docs: https://canvas.instructure.com/doc/api/conferences.html"
          field :duration_minutes, Int, "Example: 0", null: true
          field :title, String, "Example: course2: Test conference 3 [170]_0", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "Example: 2013-12-12T16:09:33.903-07:00", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "Example: 2013-12-12T16:09:09.960-07:00", null: true
          field :playback_url, String, "Example: http://example.com/recording_url", null: true

        end
      end
    end
  end
end