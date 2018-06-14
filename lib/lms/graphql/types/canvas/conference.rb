require_relative "../canvas_base_type"
require_relative "conference_recording"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Conference < BaseType
          description "Conferences. API Docs: https://canvas.instructure.com/doc/api/conferences.html"
          field :id, ID, "The id of the conference.Example: 170", null: true
          field :conference_type, String, "The type of conference.Example: AdobeConnect", null: true
          field :conference_key, String, "The 3rd party's ID for the conference.Example: abcdjoelisgreatxyz", null: true
          field :description, String, "The description for the conference.Example: Conference Description", null: true
          field :duration, Int, "The expected duration the conference is supposed to last.Example: 60", null: true
          field :ended_at, LMS::GraphQL::Types::DateTimeType, "The date that the conference ended at, null if it hasn't ended.Example: 2013-12-13T17:23:26Z", null: true
          field :started_at, LMS::GraphQL::Types::DateTimeType, "The date the conference started at, null if it hasn't started.Example: 2013-12-12T23:02:17Z", null: true
          field :title, String, "The title of the conference.Example: Test conference", null: true
          field :users, Int, "Array of user ids that are participants in the conference.Example: 1, 7, 8, 9, 10", null: true
          field :has_advanced_settings, Boolean, "True if the conference type has advanced settings..", null: true
          field :long_running, Boolean, "If true the conference is long running and has no expected end time.", null: true
          field :user_settings, String, "A collection of settings specific to the conference type.Example: true", null: true
          field :recordings, [LMS::GraphQL::Types::Canvas::ConferenceRecording], "A List of recordings for the conference.", null: true
          field :url, String, "URL for the conference, may be null if the conference type doesn't set it.", null: true
          field :join_url, String, "URL to join the conference, may be null if the conference type doesn't set it.", null: true

        end
      end
    end
  end
end