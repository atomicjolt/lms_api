require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleAppointmentGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          argument :include, String, required: false
          def resolve(id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_APPOINTMENT_GROUP",
              {
                "id": id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end