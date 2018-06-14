require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateLinkOutcomeGlobalOutcomeId < CanvasBaseMutation
          argument :id, String, required: true
          argument :outcome_id, Int, required: true
          argument :move_from, Int, required: false
          argument :title, String, required: false
          argument :display_name, String, required: false
          argument :description, String, required: false
          argument :vendor_guid, String, required: false
          argument :mastery_points, Int, required: false
          argument :ratings_description, String, required: false
          argument :ratings_points, Int, required: false
          argument :calculation_method, String, required: false
          argument :calculation_int, Int, required: false
          field :outcome_link, LMS::GraphQL::Types::Canvas::OutcomeLink, null: false
          def resolve(id:, outcome_id:, move_from: nil, title: nil, display_name: nil, description: nil, vendor_guid: nil, mastery_points: nil, ratings_description: nil, ratings_points: nil, calculation_method: nil, calculation_int: nil)
            ctx[:canvas_api].proxy(
              "CREATE_LINK_OUTCOME_GLOBAL_OUTCOME_ID",
              {
                "id": id,
                "outcome_id": outcome_id,
                "move_from": move_from,
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