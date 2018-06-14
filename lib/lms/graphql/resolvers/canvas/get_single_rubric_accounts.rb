require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/rubric"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetSingleRubricAccount < CanvasBaseResolver
          type LMS::GraphQL::Types::Canvas::Rubric, null: false
          argument :account_id, ID, required: true
          argument :id, ID, required: true
          argument :include, String, required: false
          argument :style, String, required: false
          def resolve(account_id:, id:, include: nil, style: nil)
            context[:canvas_api].proxy(
              "GET_SINGLE_RUBRIC_ACCOUNTS",
              {
                "account_id": account_id,
                "id": id,
                "include": include,
                "style": style              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end