require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListCoursesForUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Course], null: false
          argument :user_id, ID, required: true
          argument :include, String, required: false
          argument :state, String, required: false
          argument :enrollment_state, String, required: false
          def resolve(user_id:, include: nil, state: nil, enrollment_state: nil)
            context[:canvas_api].proxy(
              "LIST_COURSES_FOR_USER",
              {
                "user_id": user_id,
                "include": include,
                "state": state,
                "enrollment_state": enrollment_state              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end