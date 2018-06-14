require_relative "../canvas_base_type"


module LMS
  module GraphQL
    module Types
      module Canvas
        class FederatedAttributeConfig < BaseType
          description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
          field :attribute, String, "The name of the attribute as it will be sent from the authentication provider.Example: mail", null: true
          field :provisioning_only, Boolean, "If the attribute should be applied only when provisioning a new user, rather than all logins.", null: true

        end
      end
    end
  end
end