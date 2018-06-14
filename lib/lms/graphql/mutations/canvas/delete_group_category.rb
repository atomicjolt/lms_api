require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class DeleteGroupCategory < CanvasBaseMutation
          argument :group_category_id, String, required: true
          field :return_value, Boolean, null: false
          def resolve(group_category_id:)
            ctx[:canvas_api].proxy(
              "DELETE_GROUP_CATEGORY",
              {
                "group_category_id": group_category_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end