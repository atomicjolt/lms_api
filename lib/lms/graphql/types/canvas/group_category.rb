require_relative "../canvas_base_type"
require_relative "progress"

module LMS
  module GraphQL
    module Types
      module Canvas
        class GroupCategorySelfSignupEnum < ::GraphQL::Schema::Enum
          value "restricted"
          value "enabled"
        end

                class GroupCategoryAutoLeaderEnum < ::GraphQL::Schema::Enum
          value "first"
          value "random"
        end
        class GroupCategory < BaseType
          description "Group Categories. API Docs: https://canvas.instructure.com/doc/api/group_categories.html"
          field :id, ID, "The ID of the group category..Example: 17", null: true
          field :name, String, "The display name of the group category..Example: Math Groups", null: true
          field :role, String, "Certain types of group categories have special role designations. Currently, these include: 'communities', 'student_organized', and 'imported'. Regular course/account group categories have a role of null..Example: communities", null: true
          field :self_signup, GroupCategorySelfSignupEnum, "If the group category allows users to join a group themselves, thought they may only be a member of one group per group category at a time. Values include 'restricted', 'enabled', and null 'enabled' allows students to assign themselves to a group 'restricted' restricts them to only joining a group in their section null disallows students from joining groups.", null: true
          field :auto_leader, GroupCategoryAutoLeaderEnum, "Gives instructors the ability to automatically have group leaders assigned.  Values include 'random', 'first', and null; 'random' picks a student from the group at random as the leader, 'first' sets the first student to be assigned to the group as the leader.", null: true
          field :context_type, String, "The course or account that the category group belongs to. The pattern here is that whatever the context_type is, there will be an _id field named after that type. So if instead context_type was 'Course', the course_id field would be replaced by an course_id field..Example: Account", null: true
          field :account_id, ID, "Example: 3", null: true
          field :group_limit, Int, "If self-signup is enabled, group_limit can be set to cap the number of users in each group. If null, there is no limit..", null: true
          field :sis_group_category_id, ID, "The SIS identifier for the group category. This field is only included if the user has permission to manage or view SIS information..", null: true
          field :sis_import_id, ID, "The unique identifier for the SIS import. This field is only included if the user has permission to manage SIS information..", null: true
          field :progress, LMS::GraphQL::Types::Canvas::Progress, "If the group category has not yet finished a randomly student assignment request, a progress object will be attached, which will contain information related to the progress of the assignment request. Refer to the Progress API for more information.", null: true

        end
      end
    end
  end
end