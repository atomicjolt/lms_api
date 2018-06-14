require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CopyFile < CanvasBaseMutation
          argument :dest_folder_id, String, required: true
          argument :source_file_id, String, required: true
          argument :on_duplicate, String, required: false
          field :file, LMS::GraphQL::Types::Canvas::File, null: false
          def resolve(dest_folder_id:, source_file_id:, on_duplicate: nil)
            ctx[:canvas_api].proxy(
              "COPY_FILE",
              {
                "dest_folder_id": dest_folder_id,
                "source_file_id": source_file_id,
                "on_duplicate": on_duplicate              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end