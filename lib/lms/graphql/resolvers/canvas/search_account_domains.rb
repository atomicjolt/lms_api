require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class SearchAccountDomain < CanvasBaseResolver
          type Boolean, null: false
          argument :name, String, required: false
          argument :domain, String, required: false
          argument :latitude, Float, required: false
          argument :longitude, Float, required: false
          def resolve(name: nil, domain: nil, latitude: nil, longitude: nil)
            context[:canvas_api].proxy(
              "SEARCH_ACCOUNT_DOMAINS",
              {
                "name": name,
                "domain": domain,
                "latitude": latitude,
                "longitude": longitude              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end