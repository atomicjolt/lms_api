require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetCourseCopyStatus < CanvasBaseResolver
          type Boolean, null: false
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          def resolve(course_id:, id:)
            context[:canvas_api].proxy(
              "GET_COURSE_COPY_STATUS",
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