require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFolderGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Folder, null: false
          argument :group_id, String, required: true
          argument :id, String, required: true
          def resolve(group_id:, id:)
            context[:canvas_api].proxy(
              "GET_FOLDER_GROUPS",
              {
                "group_id": group_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end