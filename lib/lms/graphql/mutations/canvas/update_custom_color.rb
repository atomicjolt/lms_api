require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateCustomColor < CanvasBaseMutation
          argument :id, String, required: true
          argument :asset_string, String, required: true
          argument :hexcode, String, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, asset_string:, hexcode: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_CUSTOM_COLOR",
              {
                "id": id,
                "asset_string": asset_string,
                "hexcode": hexcode              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end