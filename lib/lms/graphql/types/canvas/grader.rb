require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class Grader < BaseType
          description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
          field :id, ID, "the user_id of the user who graded the contained submissions.Example: 27", null: true
          field :name, String, "the name of the user who graded the contained submissions.Example: Some User", null: true
          field :assignments, Int, "the assignment groups for all submissions in this response that were graded by this user.  The details are not nested inside here, but the fact that an assignment is present here means that the grader did grade submissions for this assignment on the contextual date. You can use the id of a grader and of an assignment to make another API call to find all submissions for a grader/assignment combination on a given date..Example: 1, 2, 3", null: true

        end
      end
    end
  end
end