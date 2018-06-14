require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class HideStreamItem < CanvasBaseMutation
          argument :id, ID, required: true
          field :return_value, Boolean, null: false
          def resolve(id:)
            ctx[:canvas_api].proxy(
              "HIDE_STREAM_ITEM",
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