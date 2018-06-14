require_relative "../canvas_base_type"
require_relative "account"

module LMS
  module GraphQL
    module Types
      module Canvas
        class Role < BaseType
          description "Roles. API Docs: https://canvas.instructure.com/doc/api/roles.html"
          field :label, String, "The label of the role..Example: New Role", null: true
          field :role, String, "The label of the role. (Deprecated alias for 'label').Example: New Role", null: true
          field :base_role_type, String, "The role type that is being used as a base for this role. For account-level roles, this is 'AccountMembership'. For course-level roles, it is an enrollment type..Example: AccountMembership", null: true
          field :account, LMS::GraphQL::Types::Canvas::Account, "JSON representation of the account the role is in..Example: 1019, CGNU, 73, 1, cgnu", null: true
          field :workflow_state, String, "The state of the role: 'active', 'inactive', or 'built_in'.Example: active", null: true
          field :permissions, String, "A dictionary of permissions keyed by name (see permissions input parameter in the 'Create a role' API)..Example: {'enabled'=>true, 'locked'=>false, 'readonly'=>false, 'explicit'=>true, 'prior_default'=>false}, {'enabled'=>true, 'locked'=>true, 'readonly'=>true, 'explicit'=>false}, {'enabled'=>false, 'locked'=>true, 'readonly'=>false, 'explicit'=>true, 'prior_default'=>false}, {'enabled'=>true, 'locked'=>false, 'readonly'=>false, 'explicit'=>false}", null: true

        end
      end
    end
  end
end