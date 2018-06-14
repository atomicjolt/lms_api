require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/report"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class StartReport < CanvasBaseMutation
          argument :account_id, String, required: true
          argument :report, String, required: true
          argument :parameters, String, required: false
          argument :parameters_course_id, Int, required: false
          argument :parameters_users, Boolean, required: false
          field :report, LMS::GraphQL::Types::Canvas::Report, null: false
          def resolve(account_id:, report:, parameters: nil, parameters_course_id: nil, parameters_users: nil)
            ctx[:canvas_api].proxy(
              "START_REPORT",
              {
                "account_id": account_id,
                "report": report,
                "parameters": parameters,
                "parameters[course_id]": parameters_course_id,
                "parameters[users]": parameters_users              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end