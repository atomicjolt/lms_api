require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PollChoice < BaseType
          description "PollChoices. API Docs: https://canvas.instructure.com/doc/api/poll_choices.html"
          field :id, ID, "The unique identifier for the poll choice..Example: 1023", null: true
          field :poll_id, ID, "The id of the poll this poll choice belongs to..Example: 1779", null: true
          field :is_correct, Boolean, "Specifies whether or not this poll choice is a 'correct' choice..Example: true", null: true
          field :text, String, "The text of the poll choice..Example: Choice A", null: true
          field :position, Int, "The order of the poll choice in relation to it's sibling poll choices..Example: 1", null: true

        end
      end
    end
  end
end