require_relative "../canvas_base_type"
require_relative "user"
require_relative "lock_info"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Page < BaseType
          description "Pages. API Docs: https://canvas.instructure.com/doc/api/pages.html"
          field :url, String, "the unique locator for the page.Example: my-page-title", null: true
          field :title, String, "the title of the page.Example: My Page Title", null: true
          field :created_at, LMS::GraphQL::Types::DateTimeType, "the creation date for the page.Example: 2012-08-06T16:46:33-06:00", null: true
          field :updated_at, LMS::GraphQL::Types::DateTimeType, "the date the page was last updated.Example: 2012-08-08T14:25:20-06:00", null: true
          field :hide_from_students, Boolean, "(DEPRECATED) whether this page is hidden from students (note: this is always reflected as the inverse of the published value).", null: true
          field :editing_roles, String, "roles allowed to edit the page; comma-separated list comprising a combination of 'teachers', 'students', 'members', and/or 'public' if not supplied, course defaults are used.Example: teachers,students", null: true
          field :last_edited_by, LMS::GraphQL::Types::Canvas::User, "the User who last edited the page (this may not be present if the page was imported from another system).", null: true
          field :body, String, "the page content, in HTML (present when requesting a single page; omitted when listing pages).Example: <p>Page Content</p>", null: true
          field :published, Boolean, "whether the page is published (true) or draft state (false)..Example: true", null: true
          field :front_page, Boolean, "whether this page is the front page for the wiki.", null: true
          field :locked_for_user, Boolean, "Whether or not this is locked for the user..", null: true
          field :lock_info, LMS::GraphQL::Types::Canvas::LockInfo, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", null: true
          field :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This page is locked until September 1 at 12:00am", null: true

        end
      end
    end
  end
end