require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class RubricAssessment < BaseType
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
          field :id, Int, "the ID of the rubric.Example: 1", null: true
          field :rubric_id, Int, "the rubric the assessment belongs to.Example: 1", null: true
          field :rubric_association_id, Int, "Example: 2", null: true
          field :score, Int, "Example: 5.0", null: true
          field :artifact_type, String, "the object of the assessment.Example: Submission", null: true
          field :artifact_id, Int, "the id of the object of the assessment.Example: 3", null: true
          field :artifact_attempt, Int, "the current number of attempts made on the object of the assessment.Example: 2", null: true
          field :assessment_type, String, "the type of assessment. values will be either 'grading', 'peer_review', or 'provisional_grade'.Example: grading", null: true
          field :assessor_id, Int, "user id of the person who made the assessment.Example: 6", null: true
          field :data, String, "(Optional) If 'full' is included in the 'style' parameter, returned assessments will have their full details contained in their data hash. If the user does not request a style, this key will be absent..", null: true
          field :comments, String, "(Optional) If 'comments_only' is included in the 'style' parameter, returned assessments will include only the comments portion of their data hash. If the user does not request a style, this key will be absent..", null: true

        end
      end
    end
  end
end