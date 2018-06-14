require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page_revision"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RevertToRevisionGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :url, String, required: true
          argument :revision_id, ID, required: true
          field :page_revision, LMS::GraphQL::Types::Canvas::PageRevision, null: false
          def resolve(group_id:, url:, revision_id:)
            ctx[:canvas_api].proxy(
              "REVERT_TO_REVISION_GROUPS",
              {
                "group_id": group_id,
                "url": url,
                "revision_id": revision_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end