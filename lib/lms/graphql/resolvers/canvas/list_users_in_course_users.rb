require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUsersInCourseUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::User], null: false
          argument :course_id, ID, required: true
          argument :search_term, String, required: false
          argument :enrollment_type, String, required: false
          argument :enrollment_role, String, required: false
          argument :enrollment_role_id, ID, required: false
          argument :include, String, required: false
          argument :user_id, ID, required: false
          argument :user_ids, [ID], required: false
          argument :enrollment_state, String, required: false
          def resolve(course_id:, search_term: nil, enrollment_type: nil, enrollment_role: nil, enrollment_role_id: nil, include: nil, user_id: nil, user_ids: nil, enrollment_state: nil)
            context[:canvas_api].proxy(
              "LIST_USERS_IN_COURSE_USERS",
              {
                "course_id": course_id,
                "search_term": search_term,
                "enrollment_type": enrollment_type,
                "enrollment_role": enrollment_role,
                "enrollment_role_id": enrollment_role_id,
                "include": include,
                "user_id": user_id,
                "user_ids": user_ids,
                "enrollment_state": enrollment_state              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end