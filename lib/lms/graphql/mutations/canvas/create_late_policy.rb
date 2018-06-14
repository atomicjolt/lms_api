require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateLatePolicy < CanvasBaseMutation
          argument :id, ID, required: true
          argument :late_policy_missing_submission_deduction_enabled, Boolean, required: false
          argument :late_policy_missing_submission_deduction, Float, required: false
          argument :late_policy_late_submission_deduction_enabled, Boolean, required: false
          argument :late_policy_late_submission_deduction, Float, required: false
          argument :late_policy_late_submission_interval, String, required: false
          argument :late_policy_late_submission_minimum_percent_enabled, Boolean, required: false
          argument :late_policy_late_submission_minimum_percent, Float, required: false
          field :return_value, Boolean, null: false
          def resolve(id:, late_policy_missing_submission_deduction_enabled: nil, late_policy_missing_submission_deduction: nil, late_policy_late_submission_deduction_enabled: nil, late_policy_late_submission_deduction: nil, late_policy_late_submission_interval: nil, late_policy_late_submission_minimum_percent_enabled: nil, late_policy_late_submission_minimum_percent: nil)
            ctx[:canvas_api].proxy(
              "CREATE_LATE_POLICY",
              {
                "id": id,
                "late_policy[missing_submission_deduction_enabled]": late_policy_missing_submission_deduction_enabled,
                "late_policy[missing_submission_deduction]": late_policy_missing_submission_deduction,
                "late_policy[late_submission_deduction_enabled]": late_policy_late_submission_deduction_enabled,
                "late_policy[late_submission_deduction]": late_policy_late_submission_deduction,
                "late_policy[late_submission_interval]": late_policy_late_submission_interval,
                "late_policy[late_submission_minimum_percent_enabled]": late_policy_late_submission_minimum_percent_enabled,
                "late_policy[late_submission_minimum_percent]": late_policy_late_submission_minimum_percent              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end