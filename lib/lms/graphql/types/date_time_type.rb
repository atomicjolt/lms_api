# module LMS
#   module GraphQL
#     module Types
#       class DateTimeType < ::GraphQL::Schema::Scalar
#         coerce_input ->(value, _ctx) { Time.zone.parse(value) }
#         coerce_result ->(value, _ctx) { value.utc.iso8601 }
#       end
#     end
#   end
# end

module LMS
  module GraphQL
    module Types
      DateTimeType = ::GraphQL::ScalarType.define do
        name "DateTime"

        coerce_input ->(value, _ctx) { Time.zone.parse(value) }
        coerce_result ->(value, _ctx) { value.utc.iso8601 }
      end
    end
  end
end
