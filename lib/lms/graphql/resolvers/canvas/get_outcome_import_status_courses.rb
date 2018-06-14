require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_import"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetOutcomeImportStatusCourse < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::OutcomeImport, null: false
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "GET_OUTCOME_IMPORT_STATUS_COURSES",
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