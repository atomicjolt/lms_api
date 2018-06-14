require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class PostEntryCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :message, String, required: false
          argument :attachment, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, topic_id:, message: nil, attachment: nil)
            ctx[:canvas_api].proxy(
              "POST_ENTRY_COURSES",
              {
                "course_id": course_id,
                "topic_id": topic_id,
                "message": message,
                "attachment": attachment              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end