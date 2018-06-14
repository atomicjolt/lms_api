require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/collaboration"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCollaborationsGroup < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Collaboration], null: false
          argument :group_id, String, required: true
          def resolve(group_id:)
            context[:canvas_api].proxy(
              "LIST_COLLABORATIONS_GROUPS",
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