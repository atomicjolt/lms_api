require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class FilesUploadFile < CanvasBaseMutation
          argument :folder_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(folder_id:)
            ctx[:canvas_api].proxy(
              "FILES_UPLOAD_FILE",
              {
                "folder_id": folder_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end