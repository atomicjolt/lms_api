require_relative "../canvas_base_resolver"

module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleTopicGroup < CanvasBaseResolver
          type Boolean, null: false
          argument :group_id, ID, required: true
          argument :topic_id, ID, required: true
          argument :include, String, required: false
          def resolve(group_id:, topic_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_TOPIC_GROUPS",
              {
                "group_id": group_id,
                "topic_id": topic_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end