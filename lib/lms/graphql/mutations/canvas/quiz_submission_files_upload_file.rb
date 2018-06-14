require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class QuizSubmissionFilesUploadFile < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :quiz_id, ID, required: true
          argument :name, String, required: false
          argument :on_duplicate, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, quiz_id:, name: nil, on_duplicate: nil)
            ctx[:canvas_api].proxy(
              "QUIZ_SUBMISSION_FILES_UPLOAD_FILE",
              {
                "course_id": course_id,
                "quiz_id": quiz_id,
                "name": name,
                "on_duplicate": on_duplicate              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end