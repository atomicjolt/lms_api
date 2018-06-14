require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CopyFolder < CanvasBaseMutation
          argument :dest_folder_id, String, required: true
          argument :source_folder_id, String, required: true
          field :folder, LMS::GraphQL::Types::Canvas::Folder, null: false
          def resolve(dest_folder_id:, source_folder_id:)
            ctx[:canvas_api].proxy(
              "COPY_FOLDER",
              {
                "dest_folder_id": dest_folder_id,
                "source_folder_id": source_folder_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end