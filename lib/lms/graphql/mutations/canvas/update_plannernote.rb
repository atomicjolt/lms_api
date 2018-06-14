require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdatePlannernote < CanvasBaseMutation
          argument :id, String, required: true
          argument :title, String, required: false
          argument :details, String, required: false
          argument :todo_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_id, Int, required: false
          field :planner_note, LMS::GraphQL::Types::Canvas::PlannerNote, null: false
          def resolve(id:, title: nil, details: nil, todo_date: nil, course_id: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_PLANNERNOTE",
              {
                "id": id,
                "title": title,
                "details": details,
                "todo_date": todo_date,
                "course_id": course_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end