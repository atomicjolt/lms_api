require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetDashboardPosition < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "GET_DASHBOARD_POSITIONS",
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