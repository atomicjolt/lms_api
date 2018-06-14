require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class MarkAllAsRead < CanvasBaseMutation

          field :return_value, Boolean, null: false
          def resolve()
            ctx[:canvas_api].proxy(
              "MARK_ALL_AS_READ",
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