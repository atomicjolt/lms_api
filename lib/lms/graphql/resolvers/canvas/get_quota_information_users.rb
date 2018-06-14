require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetQuotaInformationUser < CanvasBaseResolver
          type Boolean, null: false
          argument :user_id, ID, required: true
          def resolve(user_id:)
            context[:canvas_api].proxy(
              "GET_QUOTA_INFORMATION_USERS",
              {
                "user_id": user_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end