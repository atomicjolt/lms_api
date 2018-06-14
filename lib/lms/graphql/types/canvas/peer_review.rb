require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class PeerReview < BaseType
          description "Peer Reviews. API Docs: https://canvas.instructure.com/doc/api/peer_reviews.html"
          field :assessor_id, ID, "The assessors user id.Example: 23", null: true
          field :asset_id, ID, "The id for the asset associated with this Peer Review.Example: 13", null: true
          field :asset_type, String, "The type of the asset.Example: Submission", null: true
          field :id, ID, "The id of the Peer Review.Example: 1", null: true
          field :user_id, ID, "The user id for the owner of the asset.Example: 7", null: true
          field :workflow_state, String, "The state of the Peer Review, either 'assigned' or 'completed'.Example: assigned", null: true
          field :user, String, "the User object for the owner of the asset if the user include parameter is provided (see user API) (optional).Example: User", null: true
          field :assessor, String, "The User object for the assessor if the user include parameter is provided (see user API) (optional).Example: User", null: true
          field :submission_comments, String, "The submission comments associated with this Peer Review if the submission_comment include parameter is provided (see submissions API) (optional).Example: SubmissionComment", null: true

        end
      end
    end
  end
end