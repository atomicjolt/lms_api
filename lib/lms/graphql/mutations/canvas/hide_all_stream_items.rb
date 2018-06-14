require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class HideAllStreamItem < CanvasBaseMutation

          field :return_value, Boolean, null: false
          def resolve()
            ctx[:canvas_api].proxy(
              "HIDE_ALL_STREAM_ITEMS",
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