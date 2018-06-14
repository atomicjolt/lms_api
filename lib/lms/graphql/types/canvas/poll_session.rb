require_relative "../canvas_base_type"
require_relative "poll_submission"

module LMS
  module GraphQL
    module Types
      module Canvas
        class PollSession < BaseType
          description "Poll Sessions. API Docs: https://canvas.instructure.com/doc/api/poll_sessions.html"
          field :id, ID, "The unique identifier for the poll session..Example: 1023", null: true
          field :poll_id, ID, "The id of the Poll this poll session is associated with.Example: 55", null: true
          field :course_id, ID, "The id of the Course this poll session is associated with.Example: 1111", null: true
          field :course_section_id, ID, "The id of the Course Section this poll session is associated with.Example: 444", null: true
          field :is_published, Boolean, "Specifies whether or not this poll session has been published for students to participate in..Example: true", null: true
          field :has_public_results, Boolean, "Specifies whether the results are viewable by students..Example: true", null: true
          field :created_at, String, "The time at which the poll session was created..Example: 2014-01-07T15:16:18Z", null: true
          field :results, String, "The results of the submissions of the poll. Each key is the poll choice id, and the value is the count of submissions..Example: 10, 3, 27, 8", null: true
          field :poll_submissions, LMS::GraphQL::Types::Canvas::PollSubmission, "If the poll session has public results, this will return an array of all submissions, viewable by both students and teachers. If the results are not public, for students it will return their submission only..", null: true

        end
      end
    end
  end
end