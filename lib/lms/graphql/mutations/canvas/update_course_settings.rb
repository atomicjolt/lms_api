require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class UpdateCourseSetting < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :allow_student_discussion_topics, Boolean, required: false
          argument :allow_student_forum_attachments, Boolean, required: false
          argument :allow_student_discussion_editing, Boolean, required: false
          argument :allow_student_organized_groups, Boolean, required: false
          argument :hide_final_grades, Boolean, required: false
          argument :hide_distribution_graphs, Boolean, required: false
          argument :lock_all_announcements, Boolean, required: false
          argument :restrict_student_past_view, Boolean, required: false
          argument :restrict_student_future_view, Boolean, required: false
          argument :show_announcements_on_home_page, Boolean, required: false
          argument :home_page_announcement_limit, Int, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, allow_student_discussion_topics: nil, allow_student_forum_attachments: nil, allow_student_discussion_editing: nil, allow_student_organized_groups: nil, hide_final_grades: nil, hide_distribution_graphs: nil, lock_all_announcements: nil, restrict_student_past_view: nil, restrict_student_future_view: nil, show_announcements_on_home_page: nil, home_page_announcement_limit: nil)
            ctx[:canvas_api].proxy(
              "UPDATE_COURSE_SETTINGS",
              {
                "course_id": course_id,
                "allow_student_discussion_topics": allow_student_discussion_topics,
                "allow_student_forum_attachments": allow_student_forum_attachments,
                "allow_student_discussion_editing": allow_student_discussion_editing,
                "allow_student_organized_groups": allow_student_organized_groups,
                "hide_final_grades": hide_final_grades,
                "hide_distribution_graphs": hide_distribution_graphs,
                "lock_all_announcements": lock_all_announcements,
                "restrict_student_past_view": restrict_student_past_view,
                "restrict_student_future_view": restrict_student_future_view,
                "show_announcements_on_home_page": show_announcements_on_home_page,
                "home_page_announcement_limit": home_page_announcement_limit              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end