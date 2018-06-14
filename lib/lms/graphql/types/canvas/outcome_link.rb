require_relative "../canvas_base_type"
require_relative "outcome_group"
require_relative "outcome"

module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeLink < BaseType
          description "Outcome Groups. API Docs: https://canvas.instructure.com/doc/api/outcome_groups.html"
          field :url, String, "the URL for fetching/updating the outcome link. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/outcomes/1", null: true
          field :context_id, Int, "the context owning the outcome link. will match the context owning the outcome group containing the outcome link; included for convenience. may be null for links in global outcome groups..Example: 1", null: true
          field :context_type, String, "Example: Account", null: true
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, "an abbreviated OutcomeGroup object representing the group containing the outcome link..", null: true
          field :outcome, LMS::GraphQL::Types::Canvas::Outcome, "an abbreviated Outcome object representing the outcome linked into the containing outcome group..", null: true
          field :assessed, Boolean, "whether this outcome has been used to assess a student in the context of this outcome link.  In other words, this will be set to true if the context is a course, and a student has been assessed with this outcome in that course..Example: true", null: true
          field :can_unlink, Boolean, "whether this outcome link is manageable and is not the last link to an aligned outcome.", null: true

        end
      end
    end
  end
end