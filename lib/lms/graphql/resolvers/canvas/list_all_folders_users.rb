require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAllFoldersUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Folder], null: false
          argument :user_id, String, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "LIST_ALL_FOLDERS_USERS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end