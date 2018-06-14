require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateSingleGradingPeriod < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :id, String, required: true
          argument :grading_periods_start_date, [LMS::GraphQL::Types::DateTimeType], required: true
          argument :grading_periods_end_date, [LMS::GraphQL::Types::DateTimeType], required: true
          argument :grading_periods_weight, Float, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, id:, grading_periods_start_date:, grading_periods_end_date:, grading_periods_weight: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_SINGLE_GRADING_PERIOD",
              {
                "course_id": course_id,
                "id": id,
                "grading_periods[start_date]": grading_periods_start_date,
                "grading_periods[end_date]": grading_periods_end_date,
                "grading_periods[weight]": grading_periods_weight              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end