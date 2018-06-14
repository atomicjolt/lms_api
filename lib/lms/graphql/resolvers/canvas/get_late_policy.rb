require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetLatePolicy < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "GET_LATE_POLICY",
              {
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end