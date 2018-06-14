require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class FederatedAttributesConfig < BaseType
          description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
          field :admin_roles, String, "A comma separated list of role names to grant to the user. Note that these only apply at the root account level, and not sub-accounts. If the attribute is not marked for provisioning only, the user will also be removed from any other roles they currently hold that are not still specified by the IdP..", null: true
          field :display_name, String, "The full display name of the user.", null: true
          field :email, String, "The user's e-mail address.", null: true
          field :given_name, String, "The first, or given, name of the user.", null: true
          field :integration_id, ID, "The secondary unique identifier for SIS purposes.", null: true
          field :locale, String, "The user's preferred locale/language.", null: true
          field :name, String, "The full name of the user.", null: true
          field :sis_user_id, ID, "The unique SIS identifier.", null: true
          field :sortable_name, String, "The full name of the user for sorting purposes.", null: true
          field :surname, String, "The surname, or last name, of the user.", null: true
          field :timezone, String, "The user's preferred time zone.", null: true

        end
      end
    end
  end
end