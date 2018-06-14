require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateEntryCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :id, ID, required: true
          argument :message, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, topic_id:, id:, message: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_ENTRY_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id,
                "id": id,
                "message": message              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end