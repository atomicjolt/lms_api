require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteOutcomeGroupCourse < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "DELETE_OUTCOME_GROUP_COURSES",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end