require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ResolvePathGroupsFullPath < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Folder], null: false
          argument :group_id, String, required: true
          def resolve(group_id:)
            context[:canvas_api].proxy(
              "RESOLVE_PATH_GROUPS_FULL_PATH",
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