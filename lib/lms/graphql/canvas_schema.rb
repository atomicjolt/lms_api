require "graphql"
require_relative "types/canvas_forward_declarations"
#require_relative "mutations/canvas/mutations"
require_relative "types/canvas/query_type"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Schema < ::GraphQL::Schema
          # mutation LMS::GraphQL::Mutations::Canvas::MutationType
          query LMS::GraphQL::Types::Canvas::QueryType
        end
      end
    end
  end
end
