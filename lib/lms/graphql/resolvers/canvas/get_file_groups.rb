require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetFileGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::File, null: false
          argument :group_id, ID, required: true
          argument :id, ID, required: true
          argument :include, String, required: false
          def resolve(group_id:, id:, include: nil)
            context[:canvas_api].proxy(
              "GET_FILE_GROUPS",
              {
                "group_id": group_id,
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end