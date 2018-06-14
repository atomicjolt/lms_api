require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ResetGroupFavorite < CanvasBaseMutation

          field :return_value, Boolean, null: false
          def resolve()
            ctx[:canvas_api].proxy(
              "RESET_GROUP_FAVORITES",
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