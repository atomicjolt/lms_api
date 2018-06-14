require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Poll < BaseType
          description "Polls. API Docs: https://canvas.instructure.com/doc/api/polls.html"
          field :id, Int, "The unique identifier for the poll..Example: 1023", null: true
          field :question, String, "The question/title of the poll..Example: What do you consider most important to your learning in this course?", null: true
          field :description, String, "A short description of the poll..Example: This poll is to determine what priorities the students in the course have.", null: true
          field :created_at, String, "The time at which the poll was created..Example: 2014-01-07T15:16:18Z", null: true
          field :user_id, Int, "The unique identifier for the user that created the poll..Example: 105", null: true
          field :total_results, String, "An aggregate of the results of all associated poll sessions, with the poll choice id as the key, and the aggregated submission count as the value..Example: 20, 5, 17", null: true

        end
      end
    end
  end
end