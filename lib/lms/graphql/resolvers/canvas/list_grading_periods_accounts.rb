require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListGradingPeriodsAccount < CanvasBaseResolver
          type Boolean, null: false
          argument :account_id, ID, required: true
          def resolve(account_id:)
            context[:canvas_api].proxy(
              "LIST_GRADING_PERIODS_ACCOUNTS",
              {
                "account_id": account_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end