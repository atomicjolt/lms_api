require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/peer_review"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllPeerReviewsSectionsSubmission < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PeerReview], null: false
          argument :section_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :submission_id, ID, required: true
          argument :include, String, required: false
          def resolve(section_id:, assignment_id:, submission_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_ALL_PEER_REVIEWS_SECTIONS_SUBMISSIONS",
              {
                "section_id": section_id,
                "assignment_id": assignment_id,
                "submission_id": submission_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end