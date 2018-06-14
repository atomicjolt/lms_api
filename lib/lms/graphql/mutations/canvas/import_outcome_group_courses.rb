require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ImportOutcomeGroupCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          argument :source_outcome_group_id, ID, required: true
          field :outcome_group, LMS::GraphQL::Types::Canvas::OutcomeGroup, null: false
          def resolve(course_id:, id:, source_outcome_group_id:)
            ctx[:canvas_api].proxy(
              "IMPORT_OUTCOME_GROUP_COURSES",
              {
                "course_id": course_id,
                "id": id,
                "source_outcome_group_id": source_outcome_group_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end