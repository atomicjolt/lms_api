require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class GroupsUploadFile < CanvasBaseMutation
          argument :group_id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(group_id:)
            ctx[:canvas_api].proxy(
              "GROUPS_UPLOAD_FILE",
              {
                "group_id": group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end