require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RemoveUsageRightsGroup < CanvasBaseMutation
          argument :group_id, ID, required: true
          argument :file_ids, [ID], required: true
          argument :folder_ids, [ID], required: false
          field :return_value, Boolean, null: false
          def resolve(group_id:, file_ids:, folder_ids: nil)
            ctx[:canvas_api].proxy(
              "REMOVE_USAGE_RIGHTS_GROUPS",
              {
                "group_id": group_id,
                "file_ids": file_ids,
                "folder_ids": folder_ids              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end