require_relative "../canvas_base_type"
require_relative "outcome_group"

module LMS
  module GraphQL
    module Types
      module Canvas
        class OutcomeGroup < BaseType
          description "Outcome Groups. API Docs: https://canvas.instructure.com/doc/api/outcome_groups.html"
          field :id, Int, "the ID of the outcome group.Example: 1", null: true
          field :url, String, "the URL for fetching/updating the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1", null: true
          field :parent_outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, "an abbreviated OutcomeGroup object representing the parent group of this outcome group, if any. omitted in the abbreviated form..", null: true
          field :context_id, Int, "the context owning the outcome group. may be null for global outcome groups. omitted in the abbreviated form..Example: 1", null: true
          field :context_type, String, "Example: Account", null: true
          field :title, String, "title of the outcome group.Example: Outcome group title", null: true
          field :description, String, "description of the outcome group. omitted in the abbreviated form..Example: Outcome group description", null: true
          field :vendor_guid, String, "A custom GUID for the learning standard..Example: customid9000", null: true
          field :subgroups_url, String, "the URL for listing/creating subgroups under the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/subgroups", null: true
          field :outcomes_url, String, "the URL for listing/creating outcome links under the outcome group. should be treated as opaque.Example: /api/v1/accounts/1/outcome_groups/1/outcomes", null: true
          field :import_url, String, "the URL for importing another group into this outcome group. should be treated as opaque. omitted in the abbreviated form..Example: /api/v1/accounts/1/outcome_groups/1/import", null: true
          field :can_edit, Boolean, "whether the current user can update the outcome group.Example: true", null: true

        end
      end
    end
  end
end