require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReActivateEnrollment < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          field :enrollment, LMS::GraphQL::Types::Canvas::Enrollment, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "RE_ACTIVATE_ENROLLMENT",
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