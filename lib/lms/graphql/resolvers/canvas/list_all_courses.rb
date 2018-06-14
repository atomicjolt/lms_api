require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListAllCourse < CanvasBaseResolver
          type Boolean, null: false
          argument :search, String, required: false
          argument :public_only, Boolean, required: false
          argument :open_enrollment_only, Boolean, required: false
          def resolve(search: nil, public_only: nil, open_enrollment_only: nil)
            context[:canvas_api].proxy(
              "LIST_ALL_COURSES",
              {
                "search": search,
                "public_only": public_only,
                "open_enrollment_only": open_enrollment_only              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end