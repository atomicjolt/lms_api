require_relative "../canvas_base_mutation"

module LMS
  module GraphQL
    module Mutations
      module Canvas
        class CreateNewDiscussionTopicCourse < CanvasBaseMutation
          argument :course_id, ID, required: true
          argument :title, String, required: false
          argument :message, String, required: false
          argument :discussion_type, String, required: false
          argument :published, Boolean, required: false
          argument :delayed_post_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :allow_rating, Boolean, required: false
          argument :lock_at, LMS::GraphQL::Types::DateTimeType, required: false
          argument :podcast_enabled, Boolean, required: false
          argument :podcast_has_student_posts, Boolean, required: false
          argument :require_initial_post, Boolean, required: false
          argument :assignment, String, required: false
          argument :is_announcement, Boolean, required: false
          argument :pinned, Boolean, required: false
          argument :position_after, String, required: false
          argument :group_category_id, ID, required: false
          argument :only_graders_can_rate, Boolean, required: false
          argument :sort_by_rating, Boolean, required: false
          argument :attachment, String, required: false
          argument :specific_sections, String, required: false
          field :return_value, Boolean, null: false
          def resolve(course_id:, title: nil, message: nil, discussion_type: nil, published: nil, delayed_post_at: nil, allow_rating: nil, lock_at: nil, podcast_enabled: nil, podcast_has_student_posts: nil, require_initial_post: nil, assignment: nil, is_announcement: nil, pinned: nil, position_after: nil, group_category_id: nil, only_graders_can_rate: nil, sort_by_rating: nil, attachment: nil, specific_sections: nil)
            ctx[:canvas_api].proxy(
              "CREATE_NEW_DISCUSSION_TOPIC_COURSES",
              {
                "course_id": course_id,
                "title": title,
                "message": message,
                "discussion_type": discussion_type,
                "published": published,
                "delayed_post_at": delayed_post_at,
                "allow_rating": allow_rating,
                "lock_at": lock_at,
                "podcast_enabled": podcast_enabled,
                "podcast_has_student_posts": podcast_has_student_posts,
                "require_initial_post": require_initial_post,
                "assignment": assignment,
                "is_announcement": is_announcement,
                "pinned": pinned,
                "position_after": position_after,
                "group_category_id": group_category_id,
                "only_graders_can_rate": only_graders_can_rate,
                "sort_by_rating": sort_by_rating,
                "attachment": attachment,
                "specific_sections": specific_sections              },
              nil,
            ).parsed_response
          end
        end
      end
    end
  end
end