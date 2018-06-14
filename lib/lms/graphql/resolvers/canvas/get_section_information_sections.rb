require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSectionInformationSection < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Section, null: false
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SECTION_INFORMATION_SECTIONS",
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