require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class ListFilesUser < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::File], null: false
          argument :user_id, String, required: true
          argument :content_types, String, required: false
          argument :search_term, String, required: false
          argument :include, String, required: false
          argument :only, [String], required: false
          argument :sort, String, required: false
          argument :order, String, required: false
          def resolve(user_id:, content_types: nil, search_term: nil, include: nil, only: nil, sort: nil, order: nil)
            context[:canvas_api].proxy(
              "LIST_FILES_USERS",
              {
                "user_id": user_id,
                "content_types": content_types,
                "search_term": search_term,
                "include": include,
                "only": only,
                "sort": sort,
                "order": order              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end