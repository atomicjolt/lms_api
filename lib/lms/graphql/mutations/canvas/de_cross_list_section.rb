require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeCrossListSection < CanvasBaseMutation
          argument :id, String, required: true
          field :section, LMS::GraphQL::Types::Canvas::Section, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "DE_CROSS_LIST_SECTION",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end