require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class EnrollmentById < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Enrollment, null: false
          argument :account_id, String, required: true
          argument :id, Int, required: true
          def resolve(account_id:, id:)
            context[:canvas_api].proxy(
              "ENROLLMENT_BY_ID",
              {
                "account_id": account_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end