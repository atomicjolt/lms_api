require_relative "../canvas_base_type"
require_relative "user"

module LMS
  module GraphQL
    module Types
      module Canvas
        class PageRevision < BaseType
          description "Pages. API Docs: https://canvas.instructure.com/doc/api/pages.html"
          field :revision_id, Int, "an identifier for this revision of the page.Example: 7", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "the time when this revision was saved.Example: 2012-08-07T11:23:58-06:00", null: true
          field :latest, Boolean, "whether this is the latest revision or not.Example: true", null: true
          field :edited_by, LMS::GraphQL::Types::Canvas::User, "the User who saved this revision, if applicable (this may not be present if the page was imported from another system).", null: true
          field :url, String, "the following fields are not included in the index action and may be omitted from the show action via summary=1 the historic url of the page.Example: old-page-title", null: true
          field :title, String, "the historic page title.Example: Old Page Title", null: true
          field :body, String, "the historic page contents.Example: <p>Old Page Content</p>", null: true

        end
      end
    end
  end
end