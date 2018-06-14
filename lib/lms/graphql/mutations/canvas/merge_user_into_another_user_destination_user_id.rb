require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class MergeUserIntoAnotherUserDestinationUserId < CanvasBaseMutation
          argument :id, ID, required: true
          argument :destination_user_id, ID, required: true
          field :user, LMS::GraphQL::Types::Canvas::User, null: false
          def resolve(id:, destination_user_id:)
            ctx[:canvas_api].proxy(
              "MERGE_USER_INTO_ANOTHER_USER_DESTINATION_USER_ID",
              {
                "id": id,
                "destination_user_id": destination_user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end