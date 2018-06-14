require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class LoadCustomDatum < CanvasBaseResolver
          type Boolean, null: false
          argument :user_id, String, required: true
          argument :ns, String, required: true
          def resolve(user_id:, ns:)
            context[:canvas_api].proxy(
              "LOAD_CUSTOM_DATA",
              {
                "user_id": user_id,
                "ns": ns              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end