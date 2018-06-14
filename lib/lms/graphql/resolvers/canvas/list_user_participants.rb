require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListUserParticipant < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          argument :registration_status, String, required: false
          def resolve(id:, registration_status: nil)
            context[:canvas_api].proxy(
              "LIST_USER_PARTICIPANTS",
              {
                "id": id,
                "registration_status": registration_status              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end