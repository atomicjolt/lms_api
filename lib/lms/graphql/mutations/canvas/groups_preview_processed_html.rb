require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class GroupsPreviewProcessedHtml < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :html, String, required: false
          field :return_value, Boolean, null: false
          def resolve(group_id:, html: nil)
            ctx[:canvas_api].proxy(
              "GROUPS_PREVIEW_PROCESSED_HTML",
              {
                "group_id": group_id,
                "html": html              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end