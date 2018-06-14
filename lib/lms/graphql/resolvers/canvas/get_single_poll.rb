require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSinglePoll < CanvasBaseResolver
          type Boolean, null: false
          argument :id, ID, required: true
          def resolve(id:)
            context[:canvas_api].proxy(
              "GET_SINGLE_POLL",
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