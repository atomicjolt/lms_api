require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateCreateFrontPageGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :wiki_page_title, String, required: false
          argument :wiki_page_body, String, required: false
          argument :wiki_page_editing_roles, String, required: false
          argument :wiki_page_notify_of_update, Boolean, required: false
          argument :wiki_page_published, Boolean, required: false
          field :page, LMS::GraphQL::Types::Canvas::Page, null: false
          def resolve(group_id:, wiki_page_title: nil, wiki_page_body: nil, wiki_page_editing_roles: nil, wiki_page_notify_of_update: nil, wiki_page_published: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_CREATE_FRONT_PAGE_GROUPS",
              {
                "group_id": group_id,
                "wiki_page[title]": wiki_page_title,
                "wiki_page[body]": wiki_page_body,
                "wiki_page[editing_roles]": wiki_page_editing_roles,
                "wiki_page[notify_of_update]": wiki_page_notify_of_update,
                "wiki_page[published]": wiki_page_published              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end