require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/collaborator"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListMembersOfCollaboration < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Collaborator], null: false
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(id:, include: nil)
            context[:canvas_api].proxy(
              "LIST_MEMBERS_OF_COLLABORATION",
              {
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