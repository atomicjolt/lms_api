require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/peer_review"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllPeerReviewsCoursesPeerReview < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PeerReview], null: false
          argument :course_id, ID, required: true
          argument :assignment_id, ID, required: true
          argument :include, String, required: false
          def resolve(course_id:, assignment_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_ALL_PEER_REVIEWS_COURSES_PEER_REVIEWS",
              {
                "course_id": course_id,
                "assignment_id": assignment_id,
                "include": include              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end