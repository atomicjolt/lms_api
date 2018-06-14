require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetPublicInlinePreviewUrl < CanvasBaseResolver
          type Boolean, null: false
          argument :id, String, required: true
          argument :submission_id, Int, required: false
          def resolve(id:, submission_id: nil)
            context[:canvas_api].proxy(
              "GET_PUBLIC_INLINE_PREVIEW_URL",
              {
                "id": id,
                "submission_id": submission_id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end