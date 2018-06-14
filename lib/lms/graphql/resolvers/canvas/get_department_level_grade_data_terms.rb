require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetDepartmentLevelGradeDataTerm < CanvasBaseResolver
          type Boolean, null: false
          argument :account_id, ID, required: true
          argument :term_id, ID, required: true
          def resolve(account_id:, term_id:)
            context[:canvas_api].proxy(
              "GET_DEPARTMENT_LEVEL_GRADE_DATA_TERMS",
              {
                "account_id": account_id,
                "term_id": term_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end