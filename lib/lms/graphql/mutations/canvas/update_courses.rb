require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateCourse < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :course_ids, [ID], required: true
          argument :event, String, required: true
          field :progress, LMS::GraphQL::Types::Canvas::Progress, null: false
          def resolve(account_id:, course_ids:, event:)
            ctx[:canvas_api].proxy(
              "UPDATE_COURSES",
              {
                "account_id": account_id,
                "course_ids": course_ids,
                "event": event              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end