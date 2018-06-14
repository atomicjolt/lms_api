require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment"
module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateAssignment < CanvasBaseMutation
          argument :course_id, String, required: true
          argument :assignment_name, String, required: true
          argument :assignment_position, Int, required: false
          argument :assignment_submission_types, String, required: false
          argument :assignment_allowed_extensions, String, required: false
          argument :assignment_turnitin_enabled, Boolean, required: false
          argument :assignment_vericite_enabled, Boolean, required: false
          argument :assignment_turnitin_settings, String, required: false
          argument :assignment_integration_data, String, required: false
          argument :assignment_integration_id, String, required: false
          argument :assignment_peer_reviews, Boolean, required: false
          argument :assignment_automatic_peer_reviews, Boolean, required: false
          argument :assignment_notify_of_update, Boolean, required: false
          argument :assignment_group_category_id, Int, required: false
          argument :assignment_grade_group_students_individually, Int, required: false
          argument :assignment_external_tool_tag_attributes, String, required: false
          argument :assignment_points_possible, Float, required: false
          argument :assignment_grading_type, String, required: false
          argument :assignment_due_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :assignment_lock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :assignment_unlock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :assignment_description, String, required: false
          argument :assignment_assignment_group_id, Int, required: false
          argument :assignment_muted, Boolean, required: false
          argument :assignment_assignment_overrides, [LMS::GraphQL::Types::Canvas::AssignmentOverride], required: false
          argument :assignment_only_visible_to_overrides, Boolean, required: false
          argument :assignment_published, Boolean, required: false
          argument :assignment_grading_standard_id, Int, required: false
          argument :assignment_omit_from_final_grade, Boolean, required: false
          argument :assignment_quiz_lti, Boolean, required: false
          argument :assignment_moderated_grading, Boolean, required: false
          field :assignment, LMS::GraphQL::Types::Canvas::Assignment, null: false
          def resolve(course_id:, assignment_name:, assignment_position: nil, assignment_submission_types: nil, assignment_allowed_extensions: nil, assignment_turnitin_enabled: nil, assignment_vericite_enabled: nil, assignment_turnitin_settings: nil, assignment_integration_data: nil, assignment_integration_id: nil, assignment_peer_reviews: nil, assignment_automatic_peer_reviews: nil, assignment_notify_of_update: nil, assignment_group_category_id: nil, assignment_grade_group_students_individually: nil, assignment_external_tool_tag_attributes: nil, assignment_points_possible: nil, assignment_grading_type: nil, assignment_due_at: nil, assignment_lock_at: nil, assignment_unlock_at: nil, assignment_description: nil, assignment_assignment_group_id: nil, assignment_muted: nil, assignment_assignment_overrides: nil, assignment_only_visible_to_overrides: nil, assignment_published: nil, assignment_grading_standard_id: nil, assignment_omit_from_final_grade: nil, assignment_quiz_lti: nil, assignment_moderated_grading: nil)
            ctx[:canvas_api].proxy(
              "CREATE_ASSIGNMENT",
              {
                "course_id": course_id,
                "assignment[name]": assignment_name,
                "assignment[position]": assignment_position,
                "assignment[submission_types]": assignment_submission_types,
                "assignment[allowed_extensions]": assignment_allowed_extensions,
                "assignment[turnitin_enabled]": assignment_turnitin_enabled,
                "assignment[vericite_enabled]": assignment_vericite_enabled,
                "assignment[turnitin_settings]": assignment_turnitin_settings,
                "assignment[integration_data]": assignment_integration_data,
                "assignment[integration_id]": assignment_integration_id,
                "assignment[peer_reviews]": assignment_peer_reviews,
                "assignment[automatic_peer_reviews]": assignment_automatic_peer_reviews,
                "assignment[notify_of_update]": assignment_notify_of_update,
                "assignment[group_category_id]": assignment_group_category_id,
                "assignment[grade_group_students_individually]": assignment_grade_group_students_individually,
                "assignment[external_tool_tag_attributes]": assignment_external_tool_tag_attributes,
                "assignment[points_possible]": assignment_points_possible,
                "assignment[grading_type]": assignment_grading_type,
                "assignment[due_at]": assignment_due_at,
                "assignment[lock_at]": assignment_lock_at,
                "assignment[unlock_at]": assignment_unlock_at,
                "assignment[description]": assignment_description,
                "assignment[assignment_group_id]": assignment_assignment_group_id,
                "assignment[muted]": assignment_muted,
                "assignment[assignment_overrides]": assignment_assignment_overrides,
                "assignment[only_visible_to_overrides]": assignment_only_visible_to_overrides,
                "assignment[published]": assignment_published,
                "assignment[grading_standard_id]": assignment_grading_standard_id,
                "assignment[omit_from_final_grade]": assignment_omit_from_final_grade,
                "assignment[quiz_lti]": assignment_quiz_lti,
                "assignment[moderated_grading]": assignment_moderated_grading              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end