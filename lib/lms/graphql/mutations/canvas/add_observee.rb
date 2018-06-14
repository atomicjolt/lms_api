require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class AddObservee < CanvasBaseMutation
          argument :user_id, ID, required: true
          argument :observee_id, ID, required: true
          argument :root_account_id, ID, required: false
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(user_id:, observee_id:, root_account_id: nil)
            ctx[:canvas_api].proxy(
              "ADD_OBSERVEE",
              {
                "user_id": user_id,
                "observee_id": observee_id,
                "root_account_id": root_account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end