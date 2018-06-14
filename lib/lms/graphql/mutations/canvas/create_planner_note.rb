require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreatePlannerNote < CanvasBaseMutation
          argument :title, String, required: false
          argument :details, String, required: false
          argument :todo_date, LMS::GraphQL::Types::DateTimeType, required: false
          argument :course_id, Int, required: false
          argument :linked_object_type, String, required: false
          argument :linked_object_id, Int, required: false
          field :planner_note, LMS::GraphQL::Types::Canvas::PlannerNote, null: false
          def resolve(title: nil, details: nil, todo_date: nil, course_id: nil, linked_object_type: nil, linked_object_id: nil)
            ctx[:canvas_api].proxy(
              "CREATE_PLANNER_NOTE",
              {
                "title": title,
                "details": details,
                "todo_date": todo_date,
                "course_id": course_id,
                "linked_object_type": linked_object_type,
                "linked_object_id": linked_object_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end