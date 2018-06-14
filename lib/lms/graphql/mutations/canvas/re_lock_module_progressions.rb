require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class ReLockModuleProgression < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :id, ID, required: true
          field :module, LMS::GraphQL::Types::Canvas::Module, null: false
          def resolve(course_id:, id:)
            ctx[:canvas_api].proxy(
              "RE_LOCK_MODULE_PROGRESSIONS",
              {
                "course_id": course_id,
                "id": id              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end