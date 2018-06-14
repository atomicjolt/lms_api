require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleGroup < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Group, null: false
          argument :group_id, String, required: true
          argument :include, String, required: false
          def resolve(group_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_GROUP",
              {
                "group_id": group_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end