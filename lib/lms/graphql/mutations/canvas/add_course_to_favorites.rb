require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/favorite"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddCourseToFavorite < CanvasBaseMutation
          argument :id, ID, required: true
          field :favorite, LMS::GraphQL::Types::Canvas::Favorite, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "ADD_COURSE_TO_FAVORITES",
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