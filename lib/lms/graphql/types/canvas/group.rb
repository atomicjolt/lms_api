require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class GroupJoinLevelEnum < ::GraphQL::Schema::Enum
          value "parent_context_auto_join"
          value "parent_context_request"
          value "invitation_only"
        end

                class GroupRoleEnum < ::GraphQL::Schema::Enum
          value "communities"
          value "student_organized"
          value "imported"
        end
        class Group < BaseType
          description "Groups. API Docs: https://canvas.instructure.com/doc/api/groups.html"
          field :id, Int, "The ID of the group..Example: 17", null: true
          field :name, String, "The display name of the group..Example: Math Group 1", null: true
          field :description, String, "A description of the group. This is plain text..", null: true
          field :is_public, Boolean, "Whether or not the group is public.  Currently only community groups can be made public.  Also, once a group has been set to public, it cannot be changed back to private..", null: true
          field :followed_by_user, Boolean, "Whether or not the current user is following this group..", null: true
          field :join_level, GroupJoinLevelEnum, "How people are allowed to join the group.  For all groups except for community groups, the user must share the group's parent course or account.  For student organized or community groups, where a user can be a member of as many or few as they want, the applicable levels are 'parent_context_auto_join', 'parent_context_request', and 'invitation_only'.  For class groups, where students are divided up and should only be part of one group of the category, this value will always be 'invitation_only', and is not relevant. * If 'parent_context_auto_join', anyone can join and will be automatically accepted. * If 'parent_context_request', anyone  can request to join, which must be approved by a group moderator. * If 'invitation_only', only those how have received an invitation my join the group, by accepting that invitation..Example: invitation_only", null: true
          field :members_count, Int, "The number of members currently in the group.Example: 0", null: true
          field :avatar_url, String, "The url of the group's avatar.Example: https://<canvas>/files/avatar_image.png", null: true
          field :context_type, String, "The course or account that the group belongs to. The pattern here is that whatever the context_type is, there will be an _id field named after that type. So if instead context_type was 'account', the course_id field would be replaced by an account_id field..Example: Course", null: true
          field :course_id, Int, "Example: 3", null: true
          field :role, GroupRoleEnum, "Certain types of groups have special role designations. Currently, these include: 'communities', 'student_organized', and 'imported'. Regular course/account groups have a role of null..", null: true
          field :group_category_id, Int, "The ID of the group's category..Example: 4", null: true
          field :sis_group_id, String, "The SIS ID of the group. Only included if the user has permission to view SIS information..Example: group4a", null: true
          field :sis_import_id, Int, "The id of the SIS import if created through SIS. Only included if the user has permission to manage SIS information..Example: 14", null: true
          field :storage_quota_mb, Int, "the storage quota for the group, in megabytes.Example: 50", null: true
          field :permissions, String, "optional: the permissions the user has for the group. returned only for a single group and include[]=permissions.Example: true, true", null: true

        end
      end
    end
  end
end