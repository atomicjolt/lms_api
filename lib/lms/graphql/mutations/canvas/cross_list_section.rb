require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CrossListSection < CanvasBaseMutation
          argument :id, String, required: true
          argument :new_course_id, String, required: true
          field :section, LMS::GraphQL::Types::Canvas::Section, null: false
          def resolve(id:, new_course_id:)
            ctx[:canvas_api].proxy(
              "CROSS_LIST_SECTION",
              {
                "id": id,
                "new_course_id": new_course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end