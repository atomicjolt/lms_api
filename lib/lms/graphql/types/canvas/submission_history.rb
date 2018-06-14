require_relative "../canvas_base_type"
require_relative "submission_version"

module LMS
  module GraphQL
    module Types
      module Canvas
        class SubmissionHistory < BaseType
          description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
          field :submission_id, Int, "the id of the submission.Example: 4", null: true
          field :versions, [LMS::GraphQL::Types::Canvas::SubmissionVersion], "an array of all the versions of this submission.", null: true

        end
      end
    end
  end
end