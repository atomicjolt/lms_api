require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment_term"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateEnrollmentTerm < CanvasBaseMutation
          argument :account_id, ID, required: true
          argument :enrollment_term_name, String, required: false
          argument :enrollment_term_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :enrollment_term_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :enrollment_term_sis_term_id, String, required: false
          argument :enrollment_term_overrides_enrollment_type_start_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :enrollment_term_overrides_enrollment_type_end_at, LMS::GraphQL::Types::DateTimeType, required: false
          field :enrollment_term, LMS::GraphQL::Types::Canvas::EnrollmentTerm, null: false
          def resolve(account_id:, enrollment_term_name: nil, enrollment_term_start_at: nil, enrollment_term_end_at: nil, enrollment_term_sis_term_id: nil, enrollment_term_overrides_enrollment_type_start_at: nil, enrollment_term_overrides_enrollment_type_end_at: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ENROLLMENT_TERM",
              {
                "account_id": account_id,
                "enrollment_term[name]": enrollment_term_name,
                "enrollment_term[start_at]": enrollment_term_start_at,
                "enrollment_term[end_at]": enrollment_term_end_at,
                "enrollment_term[sis_term_id]": enrollment_term_sis_term_id,
                "enrollment_term[overrides][enrollment_type][start_at]": enrollment_term_overrides_enrollment_type_start_at,
                "enrollment_term[overrides][enrollment_type][end_at]": enrollment_term_overrides_enrollment_type_end_at              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end