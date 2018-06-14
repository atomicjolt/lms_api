require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PollSubmission < BaseType
          description "PollSubmissions. API Docs: https://canvas.instructure.com/doc/api/poll_submissions.html"
          field :id, Int, "The unique identifier for the poll submission..Example: 1023", null: true
          field :poll_choice_id, Int, "The unique identifier of the poll choice chosen for this submission..Example: 155", null: true
          field :user_id, Int, "the unique identifier of the user who submitted this poll submission..Example: 4555", null: true
          field :created_at, String, "The date and time the poll submission was submitted..Example: 2013-11-07T13:16:18Z", null: true

        end
      end
    end
  end
end