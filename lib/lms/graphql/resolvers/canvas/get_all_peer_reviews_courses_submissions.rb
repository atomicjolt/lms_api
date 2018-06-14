require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/peer_review"
module LMS
  module GraphQL
    module Resolvers
      module Canvas
        class GetAllPeerReviewsCoursesSubmission < CanvasBaseResolver
          type [LMS::GraphQL::Types::Canvas::PeerReview], null: false
          argument :course_id, String, required: true
          argument :assignment_id, String, required: true
          argument :submission_id, String, required: true
          argument :include, String, required: false
          def resolve(course_id:, assignment_id:, submission_id:, include: nil)
            context[:canvas_api].proxy(
              "GET_ALL_PEER_REVIEWS_COURSES_SUBMISSIONS",
              {
                "course_id": course_id,
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