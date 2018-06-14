require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/external_feed"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateExternalFeedGroup < CanvasBaseMutation
          argument :group_id, String, required: true
          argument :url, String, required: true
          argument :header_match, Boolean, required: false
          argument :verbosity, String, required: false
          field :external_feed, LMS::GraphQL::Types::Canvas::ExternalFeed, null: false
          def resolve(group_id:, url:, header_match: nil, verbosity: nil)
            ctx[:canvas_api].proxy(
              "CREATE_EXTERNAL_FEED_GROUPS",
              {
                "group_id": group_id,
                "url": url,
                "header_match": header_match,
                "verbosity": verbosity              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end