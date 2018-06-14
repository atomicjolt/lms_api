require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/conversation"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListConversation < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::Conversation], null: false
          argument :scope, String, required: false
          argument :filter, String, required: false
          argument :filter_mode, String, required: false
          argument :interleave_submissions, Boolean, required: false
          argument :include_all_conversation_ids, Boolean, required: false
          argument :include, String, required: false
          def resolve(scope: nil, filter: nil, filter_mode: nil, interleave_submissions: nil, include_all_conversation_ids: nil, include: nil)
            context[:canvas_api].proxy(
              "LIST_CONVERSATIONS",
              {
                "scope": scope,
                "filter": filter,
                "filter_mode": filter_mode,
                "interleave_submissions": interleave_submissions,
                "include_all_conversation_ids": include_all_conversation_ids,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end