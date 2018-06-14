require_relative "../canvas_base_type"
require_relative "federated_attributes_config"

module LMS
  module GraphQL
    module Types
      module Canvas
        class AuthenticationProvider < BaseType
          description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
          field :identifier_format, String, "Valid for SAML providers..Example: urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress", null: true
          field :auth_type, String, "Valid for all providers..Example: saml", null: true
          field :id, Int, "Valid for all providers..Example: 1649", null: true
          field :log_out_url, String, "Valid for SAML providers..Example: http://example.com/saml1/slo", null: true
          field :log_in_url, String, "Valid for SAML and CAS providers..Example: http://example.com/saml1/sli", null: true
          field :certificate_fingerprint, String, "Valid for SAML providers..Example: 111222", null: true
          field :requested_authn_context, String, "Valid for SAML providers..", null: true
          field :auth_host, String, "Valid for LDAP providers..Example: 127.0.0.1", null: true
          field :auth_filter, String, "Valid for LDAP providers..Example: filter1", null: true
          field :auth_over_tls, Int, "Valid for LDAP providers..", null: true
          field :auth_base, String, "Valid for LDAP and CAS providers..", null: true
          field :auth_username, String, "Valid for LDAP providers..Example: username1", null: true
          field :auth_port, Int, "Valid for LDAP providers..", null: true
          field :position, Int, "Valid for all providers..Example: 1", null: true
          field :idp_entity_id, String, "Valid for SAML providers..Example: http://example.com/saml1", null: true
          field :login_attribute, String, "Valid for SAML providers..Example: nameid", null: true
          field :sig_alg, String, "Valid for SAML providers..Example: http://www.w3.org/2001/04/xmldsig-more#rsa-sha256", null: true
          field :jit_provisioning, Boolean, "Just In Time provisioning. Valid for all providers except Canvas (which has the similar in concept self_registration setting)..", null: true
          field :federated_attributes, LMS::GraphQL::Types::Canvas::FederatedAttributesConfig, "", null: true

        end
      end
    end
  end
end