require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class GroupMembershipWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "accepted"
          value "invited"
          value "requested"
        end
        class GroupMembership < BaseType
          description "Groups. API Docs: https://canvas.instructure.com/doc/api/groups.html"
          field :id, Int, "The id of the membership object.Example: 92", null: true
          field :group_id, Int, "The id of the group object to which the membership belongs.Example: 17", null: true
          field :user_id, Int, "The id of the user object to which the membership belongs.Example: 3", null: true
          field :workflow_state, GroupMembershipWorkflowStateEnum, "The current state of the membership. Current possible values are 'accepted', 'invited', and 'requested'.Example: accepted", null: true
          field :moderator, Boolean, "Whether or not the user is a moderator of the group (the must also be an active member of the group to moderate).Example: true", null: true
          field :just_created, Boolean, "optional: whether or not the record was just created on a create call (POST), i.e. was the user just added to the group, or was the user already a member.Example: true", null: true
          field :sis_import_id, Int, "The id of the SIS import if created through SIS. Only included if the user has permission to manage SIS information..Example: 4", null: true

        end
      end
    end
  end
end