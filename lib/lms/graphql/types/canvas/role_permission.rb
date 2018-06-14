require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class RolePermission < BaseType
          description "Roles. API Docs: https://canvas.instructure.com/doc/api/roles.html"
          field :enabled, Boolean, "Whether the role has the permission.Example: true", null: true
          field :locked, Boolean, "Whether the permission is locked by this role.", null: true
          field :applies_to_self, Boolean, "Whether the permission applies to the account this role is in. Only present if enabled is true.Example: true", null: true
          field :applies_to_descendants, Boolean, "Whether the permission cascades down to sub accounts of the account this role is in. Only present if enabled is true.", null: true
          field :readonly, Boolean, "Whether the permission can be modified in this role (i.e. whether the permission is locked by an upstream role)..", null: true
          field :explicit, Boolean, "Whether the value of enabled is specified explicitly by this role, or inherited from an upstream role..Example: true", null: true
          field :prior_default, Boolean, "The value that would have been inherited from upstream if the role had not explicitly set a value. Only present if explicit is true..", null: true

        end
      end
    end
  end
end