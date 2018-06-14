require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateOutcome < CanvasBaseMutation
          argument :id, ID, required: true
          argument :title, String, required: false
          argument :display_name, String, required: false
          argument :description, String, required: false
          argument :vendor_guid, String, required: false
          argument :mastery_points, Int, required: false
          argument :ratings_description, String, required: false
          argument :ratings_points, Int, required: false
          argument :calculation_method, String, required: false
          argument :calculation_int, Int, required: false
          field :outcome, LMS::GraphQL::Types::Canvas::Outcome, null: false
          def resolve(id:, title: nil, display_name: nil, description: nil, vendor_guid: nil, mastery_points: nil, ratings_description: nil, ratings_points: nil, calculation_method: nil, calculation_int: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_OUTCOME",
              {
                "id": id,
                "title": title,
                "display_name": display_name,
                "description": description,
                "vendor_guid": vendor_guid,
                "mastery_points": mastery_points,
                "ratings[description]": ratings_description,
                "ratings[points]": ratings_points,
                "calculation_method": calculation_method,
                "calculation_int": calculation_int              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end