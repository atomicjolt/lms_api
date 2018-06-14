require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ClearCourseNickname < CanvasBaseMutation

          field :return_value, Boolean, null: false
          def resolve()
            ctx[:canvas_api].proxy(
              "CLEAR_COURSE_NICKNAMES",
              {
              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end