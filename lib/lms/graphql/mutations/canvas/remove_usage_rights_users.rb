require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class RemoveUsageRightsUser < CanvasBaseMutation
          argument :user_id, String, required: true
          argument :file_ids, String, required: true
          argument :folder_ids, String, required: false
          field :return_value, Boolean, null: false
          def resolve(user_id:, file_ids:, folder_ids: nil)
            ctx[:canvas_api].proxy(
              "REMOVE_USAGE_RIGHTS_USERS",
              {
                "user_id": user_id,
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